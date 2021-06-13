Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A71DC3A5720
	for <lists+linux-stm32@lfdr.de>; Sun, 13 Jun 2021 10:35:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43B78C59781;
	Sun, 13 Jun 2021 08:35:03 +0000 (UTC)
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com
 [115.124.28.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92057C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Jun 2021 08:35:00 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.311907|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00345262-0.000172191-0.996375;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KRgrEgd_1623573293; 
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KRgrEgd_1623573293)
 by smtp.aliyun-inc.com(10.147.41.138);
 Sun, 13 Jun 2021 16:34:54 +0800
Date: Sun, 13 Jun 2021 16:34:52 +0800
From: =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210613163452.1f01d418@zhouyanjie-virtual-machine>
In-Reply-To: <YMIoWS57Ra19E1qT@lunn.ch>
References: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623260110-25842-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YMGEutCet7fP1NZ9@lunn.ch>
 <405696cb-5987-0e56-87f8-5a1443eadc19@wanyeetech.com>
 <YMICTvjyEAgPMH9u@lunn.ch>
 <346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com>
 <12f35415-532e-5514-bc97-683fb9655091@wanyeetech.com>
 <YMIoWS57Ra19E1qT@lunn.ch>
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

5LqOIFRodSwgMTAgSnVuIDIwMjEgMTY6NTc6MjkgKzAyMDAKQW5kcmV3IEx1bm4gPGFuZHJld0Bs
dW5uLmNoPiDlhpnpgZM6Cgo+ID4gSGVyZSBpcyBJbmdlbmljJ3MgcmVwbHksIHRoZSB0aW1lIGxl
bmd0aCBjb3JyZXNwb25kaW5nIHRvIGEgdW5pdCBpcwo+ID4gMTkuNXBzICgxOTUwMGZzKS4gIAo+
IAo+IFNvbWV0aW1lcywgdGhlcmUgaXMgYSBuZWdhdGl2ZSBvZmZzZXQgaW4gdGhlIGRlbGF5cy4g
U28gYSBkZWxheSB2YWx1ZQo+IG9mIDAgd3JpdHRlbiB0byB0aGUgcmVnaXN0ZXIgYWN0dWFsbHkg
bWVhbnMgLTIwMHBzIG9yIHNvbWV0aGluZy4KCkFoLCBwZXJoYXBzIHRoaXMgZXhwbGFpbnMgd2h5
IHdlIHN0aWxsIG5lZWQgdG8gYWRkIGZpbmUtdHVuaW5nCnBhcmFtZXRlciBpbiByZ21paS1pZCBh
bmQgcmdtaWktdHhpZCBtb2RlcyB0byBlbnN1cmUgdGhhdCB0aGUgbmV0d29yawp3b3JrcyBwcm9w
ZXJseS4KCj4gCj4gICAgQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
