Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 119543A5717
	for <lists+linux-stm32@lfdr.de>; Sun, 13 Jun 2021 10:26:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC127C597AB;
	Sun, 13 Jun 2021 08:26:37 +0000 (UTC)
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com
 [115.124.28.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17EE5C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Jun 2021 08:26:35 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1052365|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0758817-0.0072256-0.916893;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KRgdwVg_1623572789; 
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KRgdwVg_1623572789)
 by smtp.aliyun-inc.com(10.147.41.121);
 Sun, 13 Jun 2021 16:26:31 +0800
Date: Sun, 13 Jun 2021 16:26:28 +0800
From: =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210613162628.2a21d7ea@zhouyanjie-virtual-machine>
In-Reply-To: <YMIk0NfOPryoY607@lunn.ch>
References: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623260110-25842-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YMGEutCet7fP1NZ9@lunn.ch>
 <405696cb-5987-0e56-87f8-5a1443eadc19@wanyeetech.com>
 <YMICTvjyEAgPMH9u@lunn.ch>
 <346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com>
 <YMIk0NfOPryoY607@lunn.ch>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQW5kcmV3LAoK5LqOIFRodSwgMTAgSnVuIDIwMjEgMTY6NDI6MjQgKzAyMDAKQW5kcmV3IEx1
bm4gPGFuZHJld0BsdW5uLmNoPiDlhpnpgZM6Cgo+ID4gICAgIFdlIGFyZSBtdWNoIG1vcmUgc3Ry
aWN0IGFib3V0IHRoaXMgbm93IHRoYW4gYmVmb3JlLiBZb3UgaGF2ZSB0bwo+ID4gdXNlIHN0YW5k
YXJkIHVuaXRzIGFuZCBjb252ZXJ0IHRvIGhhcmR3YXJlIHZhbHVlcy4gSXQgYWxzbyBtYWtlcyBp
dAo+ID4gYSBsb3QgZWFzaWVyIGZvciBEVCB3cml0ZXJzLCBpZiB0aGV5IGhhdmUgYW4gaWRlYSB3
aGF0IHRoZSB1bml0cwo+ID4gbWVhbi4KPiA+IAo+ID4gICAgIEhhdmluZyB0aGUgTUFDIGFkZCBz
bWFsbCBkZWxheXMgaXMgc29tZXRoaW5nIHlvdSBjYW4gYWRkIGxhdGVyLAo+ID4gICAgIHdpdGhv
dXQgYnJlYWtpbmcgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkuIFNvIGlmIHlvdSBjYW5ub3QKPiA+
IGRldGVybWluZSB3aGF0IHRoZSB1bml0cyBhcmUgbm93LCBqdXN0IHN1Ym1pdCB0aGUgZ2x1ZSBk
cml2ZXIKPiA+IHdpdGhvdXQgc3VwcG9ydCBmb3IgdGhpcyBmZWF0dXJlLiBJZiBhbnlib2R5IHJl
YWxseSBuZWVkcyBpdCwgdGhleQo+ID4gY2FuIGRvIHRoZSBuZWVkZWQgcmVzZWFyY2gsIG1heWJl
IGRvIHNvbWUgbWVhc3VyZW1lbnRzLCBhbmQgdGhlbgo+ID4gYWRkIHRoZSBjb2RlLgo+ID4gCj4g
PiAKPiA+IEkgZGlkIGFuIGV4cGVyaW1lbnQsIHdoZW4gdGhlIHR4IGRlbGF5IGlzIG5vdCBzZXQs
IFJHTUlJIHdvcmtzIGEgIAo+IAo+IFlvdSBoYWQgcmdtaWktaWQgaW4geW91ciBkZXZpY2UgdHJl
ZSwgc28gdGhhdCB0aGUgUEhZIGFkZGVkIHRoZQo+IGRlbGF5cz8KCkkgaGF2ZSB0cmllZCByZ21p
aS1pZCBhbmQgcmdtaWktdHhpZC4gSWYgd2UgZG9u4oCZdCBhZGQgYSBmaW5lLXR1bmluZwpwYXJh
bWV0ZXIsIGl0IHN0aWxsIGNhbuKAmXQgd29yayBwcm9wZXJseS4gSW4gdGhlc2UgdHdvIG1vZGVz
LCB3ZSBzdGlsbApuZWVkIHRvIGFkZCBhYm91dCA1MDBwcyBkZWxheSBvbiB0aGUgbWFjIHNpZGUg
dG8gZW5zdXJlIGl0IHdvcmtzCnByb3Blcmx5LgoKVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMhCgo+
IAo+IAlBbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
