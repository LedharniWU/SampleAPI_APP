//
//  ViewController.swift
//  SampleAPI_APP
//
//  Created by guest on 2019/01/25.
//  Copyright © 2019年 Ledharni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: URL = URL(string: "http://qiita.com/api/v2/items")!
        
        let task: URLSessionTask  = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                print(json)
            }
            catch {
                print(error)
            }
        })
        
        task.resume() //実行する
        
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController:UITableViewDataSource{
    
    // セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // セクションごとにセルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.bindData(text: "section: \(indexPath.section) index: \(indexPath.row)")
        return cell
    }
    
    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDelegate {
    
    // セルがタップされたときの処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")
    }
    
    // スクロールしたときの処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}



