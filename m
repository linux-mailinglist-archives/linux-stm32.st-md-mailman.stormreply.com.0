Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C3839F81A
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 15:48:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A349C57B79;
	Tue,  8 Jun 2021 13:48:49 +0000 (UTC)
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com
 [115.124.28.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECFC0C57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 13:48:45 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07798912|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.00689651-0.00422478-0.988879;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KPSTFJt_1623160119; 
Received: from 192.168.0.103(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KPSTFJt_1623160119) by smtp.aliyun-inc.com(10.147.40.7);
 Tue, 08 Jun 2021 21:48:40 +0800
To: Andrew Lunn <andrew@lunn.ch>
References: <1623086867-119039-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623086867-119039-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YL6zYgGdqxqL9c0j@lunn.ch>
 <6532a195-65db-afb3-37a2-f68bfed9d908@wanyeetech.com>
 <YL9gr2QQ/YEXNUmP@lunn.ch>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <62ad605f-3689-cab3-e43e-9b6954da8df3@wanyeetech.com>
Date: Tue, 8 Jun 2021 21:48:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <YL9gr2QQ/YEXNUmP@lunn.ch>
Content-Language: en-US
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: Add Ingenic SoCs MAC
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gQW5kcmV3LAoKT24gMjAyMS82Lzgg5LiL5Y2IODoyMSwgQW5kcmV3IEx1bm4gd3JvdGU6
Cj4gUGxlYXNlIHdyYXAgeW91ciB0ZXh0IHRvIGFyb3VuZCA3NSBjaGFyYWN0ZXJzIHBlciBsaW5l
LgoKClN1cmUuCgoKPgo+IEkgc3VzcGVjdCB5b3UgZG9uJ3QgdW5kZXJzdGFuZCBSR01JSSBkZWxh
eXMuIEFzIGkgc2FpZCwgbm9ybWFsbHksIHRoZQo+IE1BQyBkb2VzIG5vdCBhZGQgZGVsYXlzLCB0
aGUgUEhZIGRvZXMuIFBsZWFzZSB0YWtlIGEgY2xvc2VyIGxvb2sgYXQKPiB0aGlzLgoKCkFjY29y
ZGluZyB0byB0aGUgZGVzY3JpcHRpb24gb2YgZXRoZXJuZXQtY29udHJvbGxlci55YW1sLCAicmdt
aWkiIHNlZW1zCgp0byBhbGxvdyBNQUMgdG8gYWRkIFRYIGRlbGF5ICh0aGUgZGVzY3JpcHRpb24g
aW4gZXRoZXJuZXQtY29udHJvbGxlci55YW1sCgppcyAiUlggYW5kIFRYIGRlbGF5cyBhcmUgYWRk
ZWQgYnkgdGhlIE1BQyB3aGVuIHJlcXVpcmVkIiksIHdoaWxlIHJnbWlpLWlkCgphbmQgcmdtaWkt
dHhpZCBkbyBub3QgYWxsb3cgTUFDIHRvIGFkZCBkZWxheSAodGhlIGRlc2NyaXB0aW9uIGluCgpl
dGhlcm5ldC1jb250cm9sbGVyLnlhbWwgaXMiUkdNSUkgd2l0aCBpbnRlcm5hbCBSWCBhbmQgVFgg
ZGVsYXlzIHByb3ZpZGVkCgpieSB0aGUgUEhZLCB0aGUgTUFDIHNob3VsZCBub3QgYWRkIHRoZSBS
WCBvciBUWCBkZWxheXMgaW4gdGhpcyBjYXNlIiBhbmQKCiJSR01JSSB3aXRoIGludGVybmFsIFRY
IGRlbGF5IHByb3ZpZGVkIGJ5IHRoZSBQSFksIHRoZSBNQUMgc2hvdWxkIG5vdCBhZGQKCmFuIFRY
IGRlbGF5IGluIHRoaXMgY2FzZSIpLCBJIHdpbGwgYWRkIHN1cHBvcnQgZm9yIHRoZSBvdGhlciB0
aHJlZSBSR01JSSAKbW9kZXMKCmluIHRoZSBuZXh0IHZlcnNpb24gKEkgZm9yZ290IHRvIHJlcGx5
IHRvIHRoaXMgaW4gdGhlIHByZXZpb3VzIGVtYWlsKS4KCgpUaGFua3MgYW5kIGJlc3QgcmVnYXJk
cyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
