Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5F4B6B32
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99949C6048B;
	Tue, 15 Feb 2022 11:34:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82427C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644855201;
 bh=uSiLH41ols2or+PlxwtXv6HH6qStx8ca3yFi6b4NLDA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=C0u7LnaQJlzpqronJEutidojrD9Rs9+HPfwv9XaIG2pe1pfMP1sioe2Vl9vFM9DNq
 nZwBjmDqUJ6d6IWtsdVup9A/e/uWwwxCLbCxatPrPeGAq1noMvSl+LmkMf2xRjFu88
 Rk6Tg2gvRG1gWQHc8i6tnNxSPVNrSb1LaVYhbruI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.70] ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1oK5ig2JyZ-011et8; Mon, 14
 Feb 2022 17:13:21 +0100
To: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
 <20220213222737.15709-2-LinoSanfilippo@gmx.de>
 <aa45fed9-7a40-7ac1-a000-18d2805d088f@kernel.org>
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <9791fb9a-0c27-bfeb-5ff8-fb70f1968048@gmx.de>
Date: Mon, 14 Feb 2022 17:13:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aa45fed9-7a40-7ac1-a000-18d2805d088f@kernel.org>
Content-Language: en-US
X-Provags-ID: V03:K1:YBdfvrtYI85+zaH+ORjAj6/z8NhLNObYZSKxNdCEkYmHpFKgUBz
 cvg3dOdbbi7AbkXhFtpSGhjhlkoJcur1g466o350MRispTjbtggc/xvrNm0IEnPKTmC4Fkg
 ROY/D/pVATsNvg4nEopPdn+DX0L1U4hzKUnMq65l9KuxdLJPNytzgJQ4VZ54vUVWFPmvQlR
 C3w+lEE3o7q8OAa4qDaLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XsdoV41M30c=:srHLhGlF7cVIotzNvrAZis
 uQSiM1S29SECPhoaeycTYVDEbuENosTnnMUco4oF4doo7jZx2eKIrTZMBnrBnAGzmfJL/3EjQ
 igTEU41PnndVb4JN0ODqcq1P7WCMQZKckW0De9KsTBf0/FRsF80ejO/k3hhc6ImJPDqVhrlHn
 SKsNfrZFdsCqlPUwOvVz9AIOpn2/OnWYd7GOutBW6stqwzmE1da4GJq9dpSgUZSrSVP2ywmFm
 Ii4viDxn6uwc3J2L0kfYKdmuTQDdRRQQ+nGfSPz60osjW1zqoaO/VgySFNTE3w8iNUNaURHIJ
 X45vUroavjkkTFJy8IG+d7q+2Hq3CogmqeHGsa4uBbrRNZFEI1P4BoiIn1TcyrYO6R4yJqRN+
 KJ9djQWSj/eP1tiJdtT5fzCMLCynTcYa1LIVejh04Rg5gHQ23pEVsItqfaHUkyOlEOVCzm4sS
 CFsEtl9lNvVc/HwbzZ6kMUOc/fVhsjulYELnj4Rz73Ey86KYxiy8ds+HWMieszpCe1FnwkSh8
 UFpzsaXRWQbi9OYuSW7SVbL3YLRGGhgPLQlt8fLhlZpPzvuoR7QMXRAfV+XIKEu9RJDOrawpv
 uC5r4CQEuExxWDfmb8e6+wG+cMCjTtMCNsxr9IRrU173RxOUj7w31/8zEi5lpnRt3DsCMNMti
 BHjsryKAJ9YfAH3mBM9uUN4gknvVi3v6FQQ70Cv61I+yQDeBNHi/zblQGLHJbN4bfeZyRCjT5
 OYIXNVy1GOMAlug5djClhak3eJEK1n5QAzWfGihtDBfj2gXm7bUbSIjOWq+I33nMVNUqhATBB
 FKEsy+HA1zCo1sUnqvlGpbr4hBXh1VgoxVKddSe59wQYyFtt52CiK9BQo8N4xjR9K9Y9xns28
 Xhd8cecRCqm0rqKoids9EhvpOMBvGsBO3kLQHN8GGI2/y31cq/65cO4HQevpWqgHF8D6DKmZU
 zditTE3xyJ5NANlFwYtUPxMYFu1Z0ysN0LM5o/+MSbefK5jVWZC0hmIe8SjODSrcPgoGUaYkw
 om/NDfsWiaFT0CjJtFIVeaH2zDRpU5BOOQcz1It70qFNqxYoWKmduFOE9GcEl+g9PUPQJ66WY
 GZDzBgX5OiY4p0=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/9] serial: core: move RS485
 configuration tasks from drivers into core
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

CkhpLAoKT24gMTQuMDIuMjIgYXQgMDY6NDEsIEppcmkgU2xhYnkgd3JvdGU6Cj4gT24gMTMuIDAy
LiAyMiwgMjM6MjcsIExpbm8gU2FuZmlsaXBwbyB3cm90ZToKPj4gU2V2ZXJhbCBkcml2ZXJzIHRo
YXQgc3VwcG9ydCBzZXR0aW5nIHRoZSBSUzQ4NSBjb25maWd1cmF0aW9uIHZpYSB1c2Vyc3BhY2UK
Pj4gaW1wbGVtZW50IG9uIG9yIG1vcmUgb2YgdGhlIGZvbGxvd2luZyB0YXNrczoKPj4KPj4gLSBp
biBjYXNlIG9mIGFuIGludmFsaWQgUlRTIGNvbmZpZ3VyYXRpb24gKGJvdGggUlRTIGFmdGVyIHNl
bmQgYW5kIFJUUyBvbgo+PiDCoMKgIHNlbmQgc2V0IG9yIGJvdGggdW5zZXQpIGZhbGwgYmFjayB0
byBlbmFibGUgUlRTIG9uIHNlbmQgYW5kIGRpc2FibGUgUlRTCj4+IMKgwqAgYWZ0ZXIgc2VuZAo+
Pgo+PiAtIG51bGxpZnkgdGhlIHBhZGRpbmcgZmllbGQgb2YgdGhlIHJldHVybmVkIHNlcmlhbF9y
czQ4NSBzdHJ1Y3QKPj4KPj4gLSBjb3B5IHRoZSBjb25maWd1cmF0aW9uIGludG8gdGhlIHVhcnQg
cG9ydCBzdHJ1Y3QKPj4KPj4gLSBsaW1pdCBSVFMgZGVsYXlzIHRvIDEwMCBtcwo+Pgo+PiBNb3Zl
IHRoZXNlIHRhc2tzIGludG8gdGhlIHNlcmlhbCBjb3JlIHRvIG1ha2UgdGhlbSBnZW5lcmljIGFu
ZCB0byBwcm92aWRlCj4+IGEgY29uc2lzdGVudCBiZWhldmlvdXIgYW1vbmcgYWxsIGRyaXZlcnMu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExpbm8gU2FuZmlsaXBwbyA8TGlub1NhbmZpbGlwcG9AZ214
LmRlPgo+PiAtLS0KPj4gwqAgZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMgfCAxMyAr
KysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYyBiL2RyaXZlcnMv
dHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jCj4+IGluZGV4IDg0NjE5MmE3YjRiZi4uM2ZhYjQwNzAz
NTljIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYwo+PiAr
KysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYwo+PiBAQCAtMTI4Miw4ICsxMjgy
LDIxIEBAIHN0YXRpYyBpbnQgdWFydF9zZXRfcnM0ODVfY29uZmlnKHN0cnVjdCB1YXJ0X3BvcnQg
KnBvcnQsCj4+IMKgwqDCoMKgwqAgaWYgKGNvcHlfZnJvbV91c2VyKCZyczQ4NSwgcnM0ODVfdXNl
ciwgc2l6ZW9mKCpyczQ4NV91c2VyKSkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVG
QVVMVDsKPj4gwqAgK8KgwqDCoCAvKiBwaWNrIHNhbmUgc2V0dGluZ3MgaWYgdGhlIHVzZXIgaGFz
bid0ICovCj4+ICvCoMKgwqAgaWYgKCEocnM0ODUuZmxhZ3MgJiBTRVJfUlM0ODVfUlRTX09OX1NF
TkQpID09Cj4+ICvCoMKgwqDCoMKgwqDCoCAhKHJzNDg1LmZsYWdzICYgU0VSX1JTNDg1X1JUU19B
RlRFUl9TRU5EKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgcnM0ODUuZmxhZ3MgfD0gU0VSX1JTNDg1
X1JUU19PTl9TRU5EOwo+PiArwqDCoMKgwqDCoMKgwqAgcnM0ODUuZmxhZ3MgJj0gflNFUl9SUzQ4
NV9SVFNfQUZURVJfU0VORDsKPj4gK8KgwqDCoCB9Cj4+ICvCoMKgwqAgLyogY2xhbXAgdGhlIGRl
bGF5cyB0byBbMCwgMTAwbXNdICovCj4+ICvCoMKgwqAgcnM0ODUuZGVsYXlfcnRzX2JlZm9yZV9z
ZW5kID0gbWluKHJzNDg1LmRlbGF5X3J0c19iZWZvcmVfc2VuZCwgMTAwVSk7Cj4+ICvCoMKgwqAg
cnM0ODUuZGVsYXlfcnRzX2FmdGVyX3NlbmQgPSBtaW4ocnM0ODUuZGVsYXlfcnRzX2FmdGVyX3Nl
bmQsIDEwMFUpOwo+Cj4gV2h5IGlzIHRoaXMgbWFnaWMgMTAwPwoKVGhlIG9ubHkgZHJpdmVycyB0
aGF0IHNlZW0gdG8gY2FyZSBhYm91dCBhIG1heCB2YWx1ZSBmb3IgdGhlIFJUUyBkZWxheXMgdXNl
IDEwMCBtcwoob21hcC1zZXJpYWwsIGFtYmEgcGwwMTEsIDgyNTApIHNvIEkgY2hvc2UgdGhpcyB0
byBzdGF5IGNvbXBhdGlibGUgd2l0aCB0aGUgY3VycmVudApkcml2ZXIgaW1wbGVtZW50YXRpb25z
LiAxMDAgbXMgYWxzbyBzZWVtcyBsYXJnZSBlbm91Z2ggdG8gYmUgdXNlZCBhcyBhIGdlbmVyYWwg
bWF4IHZhbHVlLgoKPiBDYW4gd2UgaGF2ZSB0aGF0IG51bWJlciBzb21laG93IGRvY3VtZW50ZWQ/
IFlvdSBzaG91bGQgZGVmaW5lIGEgbWFjcm8gZm9yIHRoYXQgYW55d2F5LgoKT2ssIEkgd2lsbCBk
byBzby4KCj4KPj4gK8KgwqDCoCBtZW1zZXQocnM0ODUucGFkZGluZywgMCwgc2l6ZW9mKHJzNDg1
LnBhZGRpbmcpKTsKPgo+IFdoYXQgaXMgdGhpcyBtZW1zZXQgZ29vZCBmb3I/CgpEcml2ZXJzIGxp
a2UgbWF4MzEweCwgYW1iYS1wbDAxMSwgODI1MF9wY2ksIDgyNTBfZmludGVrLCA4MjUwX2xwYzE4
eHggc2VlbSB0byBjYXJlIGFib3V0CnJldHVybmluZyBhIHNlcmlhbF9yczQ4NSBzdHJ1Y3Qgd2l0
aCBjbGVhcmVkIHBhZGRpbmcgZmllbGQgdG8gdXNlcnNwYWNlLiBTbyB0aGV5IGFsbCBjbGVhcgp0
aGF0IGZpZWxkIG9uIHRoZWlyIG93bi4gQWx0aG91Z2ggbm90IHJlYWxseSBuZWNlc3NhcnksIHRv
IG1lIHRoaXMgc2VlbXMgdG8gYmUgYSBnb29kCmRlZmF1bHQgYmVoYXZpb3IsIHNvIEkgYWRkZWQg
aXQgdG8gdGhlIHNlcmlhbCBjb3JlLgoKPgo+PiDCoMKgwqDCoMKgIHNwaW5fbG9ja19pcnFzYXZl
KCZwb3J0LT5sb2NrLCBmbGFncyk7Cj4+IMKgwqDCoMKgwqAgcmV0ID0gcG9ydC0+cnM0ODVfY29u
ZmlnKHBvcnQsICZyczQ4NSk7Cj4+ICvCoMKgwqAgaWYgKCFyZXQpCj4+ICvCoMKgwqDCoMKgwqDC
oCBwb3J0LT5yczQ4NSA9IHJzNDg1Owo+PiDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJnBvcnQtPmxvY2ssIGZsYWdzKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPgo+IHRoYW5rcywKClRoYW5rcyBmb3IgdGhlIHJldmll
dyEKClJlZ2FyZHMsCkxpbm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
