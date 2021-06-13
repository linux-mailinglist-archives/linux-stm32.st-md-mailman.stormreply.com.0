Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFBE3A599E
	for <lists+linux-stm32@lfdr.de>; Sun, 13 Jun 2021 18:31:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EFDBC597B0;
	Sun, 13 Jun 2021 16:31:59 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF975C59780
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Jun 2021 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=Rfpd3/bKKCNWwkSNXhRu75K3KXs2S+zGTIfGuFswvLs=; b=Mj
 gvFaDw3lND4PyN5ThRZiMAoB5uVhB8oTRYdmQeDsMwhF3KyM2kqkeBIwVSAxR3XUA01KZ9BLPz2fn
 dLKNsN7NN2rWKswvyPjZuuoisztG4KxMa/3s/sqhpF2C+Utc0c7z0ED94Cud5rML6G7k9WNdgxPBZ
 1SfGlSYoF/AC9/E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lsT1M-009B5K-CB; Sun, 13 Jun 2021 18:31:36 +0200
Date: Sun, 13 Jun 2021 18:31:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Message-ID: <YMYy6JMSHm1Cqdt2@lunn.ch>
References: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623260110-25842-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YMGEutCet7fP1NZ9@lunn.ch>
 <405696cb-5987-0e56-87f8-5a1443eadc19@wanyeetech.com>
 <YMICTvjyEAgPMH9u@lunn.ch>
 <346f64d9-6949-b506-258f-4cfa7eb22784@wanyeetech.com>
 <12f35415-532e-5514-bc97-683fb9655091@wanyeetech.com>
 <YMIoWS57Ra19E1qT@lunn.ch>
 <20210613163452.1f01d418@zhouyanjie-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210613163452.1f01d418@zhouyanjie-virtual-machine>
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

T24gU3VuLCBKdW4gMTMsIDIwMjEgYXQgMDQ6MzQ6NTJQTSArMDgwMCwg5ZGo55Cw5p2wIHdyb3Rl
Ogo+IOS6jiBUaHUsIDEwIEp1biAyMDIxIDE2OjU3OjI5ICswMjAwCj4gQW5kcmV3IEx1bm4gPGFu
ZHJld0BsdW5uLmNoPiDlhpnpgZM6Cj4gCj4gPiA+IEhlcmUgaXMgSW5nZW5pYydzIHJlcGx5LCB0
aGUgdGltZSBsZW5ndGggY29ycmVzcG9uZGluZyB0byBhIHVuaXQgaXMKPiA+ID4gMTkuNXBzICgx
OTUwMGZzKS4gIAo+ID4gCj4gPiBTb21ldGltZXMsIHRoZXJlIGlzIGEgbmVnYXRpdmUgb2Zmc2V0
IGluIHRoZSBkZWxheXMuIFNvIGEgZGVsYXkgdmFsdWUKPiA+IG9mIDAgd3JpdHRlbiB0byB0aGUg
cmVnaXN0ZXIgYWN0dWFsbHkgbWVhbnMgLTIwMHBzIG9yIHNvbWV0aGluZy4KPiAKPiBBaCwgcGVy
aGFwcyB0aGlzIGV4cGxhaW5zIHdoeSB3ZSBzdGlsbCBuZWVkIHRvIGFkZCBmaW5lLXR1bmluZwo+
IHBhcmFtZXRlciBpbiByZ21paS1pZCBhbmQgcmdtaWktdHhpZCBtb2RlcyB0byBlbnN1cmUgdGhh
dCB0aGUgbmV0d29yawo+IHdvcmtzIHByb3Blcmx5LgoKUGxlYXNlIHRyeSB0byBmaW5kIHRoaXMg
b3V0LiByZ21paSBtZWFucyBubyBkZWxheS4gSWYgdGhlIGhhcmR3YXJlIGlzCmRvaW5nIC01MDBw
UyBieSBkZWZhdWx0LCB5b3UgbmVlZCB0byB0YWtlIHRoaXMgaW50byBhY2NvdW50LCBhbmQgYWRk
CnRoZSA1MDBwUyBiYWNrIG9uLgoKICAgIEFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
