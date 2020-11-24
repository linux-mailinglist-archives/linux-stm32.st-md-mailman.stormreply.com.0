Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F572C2FEF
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 19:28:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96282C56630;
	Tue, 24 Nov 2020 18:28:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39B60C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 18:28:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AOIM4kb025926; Tue, 24 Nov 2020 19:27:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=STMicroelectronics;
 bh=y5PgpLZWvVwrpeHOFsuBgZhKVxqtD4Xptw10KGhvdy4=;
 b=vbSWJ12V61pAqdp7nkwx9J0SWmlRvZVvUs855sbw3qQIvE8KyVce03B9rbIaeFrguXgv
 H8seVVGnXKeH0M4od4FAEbKznw59NnXViF1UrFuOAmUb29AUOUEZ7maGG5EgLyMVTFlT
 7BEFV03eN20MbS0uejQOD05Y4J1eT11s9w5Kh9EePrNYGzxFh64taUMDdeFl8YMa4M0v
 +4oMmdKk/qVxCqgp9pu6ea30fgfRcVpq2bL7RlbEP2M3rNppGiDgIpf37L8FwbOF16TU
 /DsYSpEgmix4z48P/A0iMIZDBnFup79e+Cybnh/czsxcjfsxwSy84jOc114sCVpbLRwN IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01ch3c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 19:27:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2159010002A;
 Tue, 24 Nov 2020 19:27:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBE9621FEBB;
 Tue, 24 Nov 2020 19:27:54 +0100 (CET)
Received: from [10.129.7.42] (10.75.127.51) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 19:27:53 +0100
Message-ID: <4a53794f1a0cea5eb009fce0b4b4c4846771f8be.camel@st.com>
From: Antonio Borneo <antonio.borneo@st.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Tue, 24 Nov 2020 19:27:03 +0100
In-Reply-To: <20201124102022.1a6e6085@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20191007154306.95827-1-antonio.borneo@st.com>
 <20191007154306.95827-5-antonio.borneo@st.com>
 <20191009152618.33b45c2d@cakuba.netronome.com>
 <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
 <e2b2b623700401538fe91e70495c348c08b5d2e3.camel@st.com>
 <20201124102022.1a6e6085@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_05:2020-11-24,
 2020-11-24 signatures=0
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, has <has@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add flexible PPS to dwmac
	4.10a
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

T24gVHVlLCAyMDIwLTExLTI0IGF0IDEwOjIwIC0wODAwLCBKYWt1YiBLaWNpbnNraSB3cm90ZToK
PiBPbiBUdWUsIDI0IE5vdiAyMDIwIDE1OjIzOjI3ICswMTAwIEFudG9uaW8gQm9ybmVvIHdyb3Rl
Ogo+ID4gT24gVHVlLCAyMDIwLTExLTI0IGF0IDE1OjE1ICswMTAwLCBBaG1hZCBGYXRvdW0gd3Jv
dGU6Cj4gPiA+IE9uIDEwLjEwLjE5IDAwOjI2LCBKYWt1YiBLaWNpbnNraSB3cm90ZTogIAo+ID4g
PiA+IE9uIE1vbiwgNyBPY3QgMjAxOSAxNzo0MzowNiArMDIwMCwgQW50b25pbyBCb3JuZW8gd3Jv
dGU6ICAKPiA+ID4gPiA+IEFsbCB0aGUgcmVnaXN0ZXJzIGFuZCB0aGUgZnVuY3Rpb25hbGl0aWVz
IHVzZWQgaW4gdGhlIGNhbGxiYWNrCj4gPiA+ID4gPiBkd21hYzVfZmxleF9wcHNfY29uZmlnKCkg
YXJlIGNvbW1vbiBiZXR3ZWVuIGR3bWFjIDQuMTBhIFsxXSBhbmQKPiA+ID4gPiA+IDUuMDBhIFsy
XS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gUmV1c2UgdGhlIHNhbWUgY2FsbGJhY2sgZm9yIGR3bWFj
IDQuMTBhIHRvby4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGVzdGVkIG9uIFNUTTMyTVAxNXgsIGJh
c2VkIG9uIGR3bWFjIDQuMTBhLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBbMV0gRFdDIEV0aGVybmV0
IFFvUyBEYXRhYm9vayA0LjEwYSBPY3RvYmVyIDIwMTQKPiA+ID4gPiA+IFsyXSBEV0MgRXRoZXJu
ZXQgUW9TIERhdGFib29rIDUuMDBhIFNlcHRlbWJlciAyMDE3Cj4gPiA+ID4gPiAKPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0BzdC5jb20+ICAK
PiA+ID4gPiAKPiA+ID4gPiBBcHBsaWVkIHRvIG5ldC1uZXh0LiAgCj4gPiA+IAo+ID4gPiBUaGlz
IHBhdGNoIHNlZW1zIHRvIGhhdmUgYmVlbiBmdXp6aWx5IGFwcGxpZWQgYXQgdGhlIHdyb25nIGxv
Y2F0aW9uLgo+ID4gPiBUaGUgZGlmZiBkZXNjcmliZXMgZXh0ZW5zaW9uIG9mIGR3bWFjIDQuMTBh
IGFuZCBzbyBkb2VzIHRoZSBAQCBsaW5lOgo+ID4gPiAKPiA+ID4gwqDCoEBAIC04NjQsNiArODY0
LDcgQEAgY29uc3Qgc3RydWN0IHN0bW1hY19vcHMgZHdtYWM0MTBfb3BzID0gewo+ID4gPiAKPiA+
ID4gVGhlIHBhdGNoIHdhcyBhcHBsaWVkIG1haW5saW5lIGFzIDc1NzkyNjI0NzgzNiAoIm5ldDog
c3RtbWFjOiBhZGQKPiA+ID4gZmxleGlibGUgUFBTIHRvIGR3bWFjIDQuMTBhIiksIGJ1dCBpdCBl
eHRlbmRzIGR3bWFjNF9vcHMgaW5zdGVhZDoKPiA+ID4gCj4gPiA+IMKgwqBAQCAtOTM4LDYgKzkz
OCw3IEBAIGNvbnN0IHN0cnVjdCBzdG1tYWNfb3BzIGR3bWFjNF9vcHMgPSB7Cj4gPiA+IAo+ID4g
PiBJIGRvbid0IGtub3cgaWYgZHdtYWM0IGFjdHVhbGx5IHN1cHBvcnRzIEZsZXhQUFMsIHNvIEkg
dGhpbmsgaXQncwo+ID4gPiBiZXR0ZXIgdG8gYmUgb24gdGhlIHNhZmUgc2lkZSBhbmQgcmV2ZXJ0
IDc1NzkyNjI0NzgzNiBhbmQgYWRkIHRoZQo+ID4gPiBjaGFuZ2UgZm9yIHRoZSBjb3JyZWN0IHZh
cmlhbnQuICAKPiA+IAo+ID4gQWdyZWUsCj4gPiB0aGUgcGF0Y2ggZ2V0IGFwcGxpZWQgdG8gdGhl
IHdyb25nIHBsYWNlIQo+IAo+IDotbwo+IAo+IFRoaXMgaGFwcGVucyBzb21ldGltZXMgd2l0aCBz
dGFibGUgYmFja3BvcnRzIGJ1dCBJJ3ZlIG5ldmVyIHNlZW4gaXQKPiBoYXBwZW4gd29ya2luZyBv
biAiY3VycmVudCIgYnJhbmNoZXMuCj4gCj4gU29ycnkgYWJvdXQgdGhhdCEKPiAKPiBXb3VsZCB5
b3UgbWluZCBzZW5kaW5nIHRoZSBhcHByb3ByaWF0ZSBwYXRjaGVzPyBJIGNhbiBkbyB0aGUgcmV2
ZXJ0IGlmCj4geW91IHByZWZlciwgYnV0IHNpbmNlIHlvdSBuZWVkIHRvIHNlbmQgdGhlIGZpeCBh
bnl3YXkuLgoKWW91IG1lYW4gc2VuZGluZyB0d28gcGF0Y2hlcyBvbmUgZm9yIHJldmVydCBhbmQg
b25lIHRvIHJlLWFwcGx5IHRoZSBjb2RlPwpPciBhIHNpbmdsZSBwYXRjaCBmb3IgdGhlIGZpeD8K
CkFudG9uaW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
