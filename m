Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED98A748C9
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Mar 2025 11:57:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F26BC78F75;
	Fri, 28 Mar 2025 10:57:11 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 961D9C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1743159403; x=1743764203; i=markus.elfring@web.de;
 bh=BsTjFY2jj2A4o4aQeM1yn18m5VjBspLLRgGpCLGwkew=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WpDGO+e8Pafgapt3mOamCiKLPrbULpkroAnOl9ooxFPHR/fNPkuOhNO9D+NtGlSc
 xwKVjPgp4XRZD4AwPykZImwZC2GGBlimJl1TBZHurMmiQ/5Qpeo7FwZW84LXuqYV5
 RXzHRoMTgT9gPICdplbHT/gZPUknsuCrQe1eQ0jsiNjiKL8Gh1C4Qcoh0Lh44EePv
 M1vZoKHqe/CTPjYmOv9mCUEpvI5z/+s0PXnQXuDfyC0HDAil/oRTCYT6BTzMa23hC
 WskAS67FlspXcYxb3ZBtukPpU5uvgs9985JRjjvOYQ7YRCUyepj1u/fOKDMwC0lZH
 ougAWFN2c0fEYLUkzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MD5jv-1tpd3y19nd-008p2m; Fri, 28
 Mar 2025 11:56:43 +0100
Message-ID: <4a17d0e2-bed9-43e5-a867-a501b991e6e7@web.de>
Date: Fri, 28 Mar 2025 11:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250327231146.6388-1-qasdev00@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250327231146.6388-1-qasdev00@gmail.com>
X-Provags-ID: V03:K1:8213H3JxfzTQowCs9fcHxElSgWiDoD0E+Gg1w0tPtaSuYYTPPy9
 Kja4WkXD0/LkPpj/SAN+o1cRvBrVIFNXeNoKNsCMK0WjzCgs3YKslikuiI0UZx13eRX9MH4
 jqCUzTqRMrmmV3twB+FRXb44dbQdb+GtVqlJTGwT8h6V67i1S3QRaZiQZPatWV3J3cC5g+f
 8NkN62sPnQKhAE8Z1UPvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+fwmZpPe2Zw=;w07p3cdLwi1BKzk99WXBuwFWIa5
 DCS74iZOzPB9xdCYFqGs0rThXtHxIFybDbMmhw/OG6CirzS79/QbgubWy8g75m5489HRYJW5O
 Ncjs/2cwJsldbhl4KkJElVIWNqN5EITI10GrD/eylok90s9KQC/VkFnmmacq21ErL1y2Kojo8
 +aiXIglCI0rFA4w+9LjIr7u7n7UmWk9O3TpxNippid/G+i+H9By1I7rG5AkzgP2Muxv32I+6v
 X9W6HTH+dRQrkVJW+f5YxZ/XW73Jf0yFxvIIbzA5VrwO43GFJhmPbxcFRQcYyT51dgwXLZWFw
 qA8ppHE6tPTiIE4T5+DhKeqhnvWzlIXFQkI6Md3vhLOea0/Z8fDwLY3t8eS9zBBomD2vOUTlI
 WgwP2DnbN8tkQFsvZDoB0D//ucMFswJ7c30GSlR4FrvTPCNDdHMnZxkransQC5jURDrRHdllM
 jTb8udFVCbhxNgNJf/ke/bRSjHfav4itVJuFUDBdeyUWhe47KPBYyPpx3K4M5xoD1/YSmjOIG
 76bbnDhZlWNygnAXgPRhJAF5/Oa0y4B/gmORF3l6njcPUoxzUXApDPsdRa4KZ+O3EwFCNAGD3
 cTGsAqMv8ceJQbViT1clB3i0u8wYrd6zIVZ+KIYa38ZW49uqMcWJPZVYNodwhcqXbmqzqLw2m
 /37ayWoiMt1uzjORW+PEbeHl5g6M0H+3WMdDCih1HG9oPE9TucBVcCmseAXFsuG+iOWb2kPAQ
 o9AF9qRXBLvNvCP7bIOOnRgz5DgM4Iflb815VUMd0Cls0TGy5wFsAxPQEDI19gb54R1v6r9tD
 ngQmac0FpdZzYRcoAB5Zp9CuXE7oWOyr2i6Fy8lahJciqxGKW9jTyf3fzSHPoe1NK1OR9BPqz
 HW8DDJwQsPv+8UpmAG8emYw/80uBhnRo0/rWzPe4b5fDiBg9mU9fz0qeWBxJlOJgHcWhwDO76
 s/kgQlq41QPi9KUfG9rdrzFxxX56RQnYjRbS/VLgm8yMvrMSBggr8Cmu8JgiO9WR98Db2c3/2
 EFuBz8eO4h5mi0StywHTNPig6QgVg1mZFPlB4hIFBvsw+KstCM14rojQb1TFAJvVVQQIyChTt
 OHwuhS0NdOSM99lntvc2N05xI9AG+qOKKQUD50TNWylkXMcOk0l0xCrTkW1d4LceWQ+ers7c8
 WE9aVL7SvoX1oikayk23bOUHsA8ofxy96MHRyq0YQDrqXQ5WeSHLEElefy8Wn2jOLylRvBO+L
 jXLHR3gwXK4lyieiU96YfTyOmKtB3awooEhgN54U/3TJkjThRRXtogRVJT9vp6EcrPqdsAnLs
 dWNFJHDJq2lFv+eUjLEwKc/4f+vVSWAJu5piBgIb2X4q8xLfxLCujJ+gQYQFy9OHioyqxduzl
 LJq6au7bIavcDFGHr6ZhWrgCPcsPGdAkWgiBfbM10HeGrr36/fN6Egk3VjiqGSeNCvA+0SFm1
 xSgg9q/93WbnUMcBKUWZ32vRADVjKg/xxOCHJyCweia8Js6cteqAC/8hvsZgAnzZtKJ6grw==
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] HID: thrustmaster: fix memory leak in
 thrustmaster_interrupts()
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

PiBJbiB0aHJ1c3RtYXN0ZXJfaW50ZXJydXB0cygpLCB0aGUgYWxsb2NhdGVkIHNlbmRfYnVmIGlz
IG5vdAo+IGZyZWVkIGlmIHRoZSB1c2JfY2hlY2tfaW50X2VuZHBvaW50cygpIGNoZWNrIGZhaWxz
LCBsZWFkaW5nCj4gdG8gYSBtZW1vcnkgbGVhay4K4oCmCgpJIGltYWdpbmUgdGhhdCB3b3JkIHdy
YXBwaW5nIGNhbiBvY2Nhc2lvbmFsbHkgYmVjb21lIGEgYml0IG5pY2VyCmZvciB0ZXh0IGxpbmVz
IHdoaWNoIG1heSBiZSBsb25nZXIgdGhhbiA1OSBjaGFyYWN0ZXJzLgoKCuKApgo+ICsrKyBiL2Ry
aXZlcnMvaGlkL2hpZC10aHJ1c3RtYXN0ZXIuYwo+IEBAIC0xNzQsNiArMTc0LDcgQEAgc3RhdGlj
IHZvaWQgdGhydXN0bWFzdGVyX2ludGVycnVwdHMoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYpCj4g
IAl1OCBlcF9hZGRyWzJdID0ge2JfZXAsIDB9Owo+Cj4gIAlpZiAoIXVzYl9jaGVja19pbnRfZW5k
cG9pbnRzKHVzYmlmLCBlcF9hZGRyKSkgewo+ICsJCWtmcmVlKHNlbmRfYnVmKTsKPiAgCQloaWRf
ZXJyKGhkZXYsICJVbmV4cGVjdGVkIG5vbi1pbnQgZW5kcG9pbnRcbiIpOwo+ICAJCXJldHVybjsK
PiAgCX0KCiogWW91IG1heSBhdm9pZCBzdWNoIHJlcGVhdGVkIGZ1bmN0aW9uIGNhbGxzIGJ5IHVz
aW5nIGFub3RoZXIgbGFiZWwgaW5zdGVhZC4KICBodHRwczovL3dpa2kuc2VpLmNtdS5lZHUvY29u
Zmx1ZW5jZS9kaXNwbGF5L2MvTUVNMTItQy4rQ29uc2lkZXIrdXNpbmcrYStnb3RvK2NoYWluK3do
ZW4rbGVhdmluZythK2Z1bmN0aW9uK29uK2Vycm9yK3doZW4rdXNpbmcrYW5kK3JlbGVhc2luZyty
ZXNvdXJjZXMjTUVNMTJDLkNvbnNpZGVydXNpbmdhZ290b2NoYWlud2hlbmxlYXZpbmdhZnVuY3Rp
b25vbmVycm9yd2hlbnVzaW5nYW5kcmVsZWFzaW5ncmVzb3VyY2VzLUNvbXBsaWFudFNvbHV0aW9u
KGNvcHlfcHJvY2VzcygpZnJvbUxpbnV4a2VybmVsKQoKKiBIb3cgZG8geW91IHRoaW5rIGFib3V0
IHRvIGJlbmVmaXQgYW55IG1vcmUgZnJvbSB0aGUgYXBwbGljYXRpb24gb2YgdGhlIGF0dHJpYnV0
ZSDigJxfX2ZyZWXigJ0/CiAgaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTQt
cmM2L3NvdXJjZS9pbmNsdWRlL2xpbnV4L2NsZWFudXAuaCNMMTQ0CgoKUmVnYXJkcywKTWFya3Vz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
