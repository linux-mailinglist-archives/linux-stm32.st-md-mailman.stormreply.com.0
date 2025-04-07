Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2CDA7DC7C
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 13:39:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 278E8C78F9B;
	Mon,  7 Apr 2025 11:39:27 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A601C78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1744025917; x=1744630717; i=markus.elfring@web.de;
 bh=7BpszykP3a8TgXiCiFnrLPKvDXMJeEZXi14t+noJhAg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XXwebaJ6g2otca99erTdOKqgrr8wdPMKcSJGjYO8sFXrDVlp6LvYz8uOtAGgrB7L
 6xs7eBLxbiBp3iJfKQHmktD6Ec4bodRdCV+OIIWc1dE1pCTiG2NBJUqvOWALW0xny
 ooo7c/QlEtNW3LOvX/x6QIqukBofE3BJZZQjiiC+/ROLyyVlEpG6GXolH8a9VfyM9
 +IdofeQb7rkL7wQ4pzx1LVnNWi1RTfoctCpjAWzyXQW5HrWX3B5a9xfsEqrIKXfs9
 orKLC/xoAqcjzwC8cmYGjIRgemtvQIw6+gNywm+F5B3P/TARbSEk8D8fEt/n/BrGi
 4+CJcXBGskXI2XO4tQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.4]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MumJF-1tA47z47z1-010NWl; Mon, 07
 Apr 2025 13:38:37 +0200
Message-ID: <5d8d6101-1a4b-4832-b263-e0f56840fdcd@web.de>
Date: Mon, 7 Apr 2025 13:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250406133551.4576-1-qasdev00@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250406133551.4576-1-qasdev00@gmail.com>
X-Provags-ID: V03:K1:7yBflSxGGeWdw7bVzYWFg7LDXkghO2FiIafj3/KBPQ0KK3LFSE6
 rUn4X4ZhrwNVxZ6nBDP2tGow1+98ZomcmoJLr5stRtCAVjXWd3LbI7HnZOuS/MUHou5NSje
 Zdle4XiyzsUdu8sgG8VyHHfeq69uRV8tUwRbaJ1TowZACZgZlBSznwewxMA9xbAX/HcWyem
 HDrFii6zNxo/tqIjm+jEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gjRTKgY1ReI=;b6/mK2dG3AeTU/SDylEZwv+v2qR
 Sa8UWWlf9Waf1XPKaaoxzSlHAvt5AT6SZAeXHcaqTF1nCFP1Ep3wDnsOn1gTuS9HlSQIuMgs6
 XAn0aNo93EsOvCAapbXP/yg+m9saqNbikQOhA0lB7R2E/8KJ7B8JSCa/+FnDnWbtylrNPyLgl
 Qa/aBH/GMwg0P3E4quhWHUNuICIbPQX23Vi4yDrEmKQj/vLrAD+MmJ+h0X54yBO9T7gvq+Qhn
 TQPTMLeGWoei4vlv7YvHKpUr+RHDq87Q5gdFg+z0ICmayROM/R8HCfCV/pD3OCNGV7qg/x4d0
 /wY8eC6rKlOzqnwoSHKFn7OJ/EucV3+B60oAU3mIVzkbgdkP8Twno8ILkxOHSyvlLuMO/RFWE
 lUUv2n5vw0LXZl3U0BiNuPMRnrc2u/EsdnVfwQFagNo4ZxQVTKUZTO6/XTZoWnwW9MiCcfisg
 GwVYlhbExyMpaQAGHWyJVpLc+R6vZX5qNMnUtzRoywQYdJGCEt8dsjL/AfJW+oezjdcQqemaE
 AC7OkNYESfHANkzbCRP84mHhRL+KOnt3UgO+UIlybXbBxuurXiatis7Oy0xCv15fDTq1WHb8G
 jNvPBLP9g1g4VHs8NaR0JyVSqrffI/p1n2UePSlZbcvAJFkZhSPAQQohah91D5EHHbqeV873c
 GH58MChwSl5cZ7dKSiWwKdIeAxfR2QsQAm8/zNBHuNAwtGbxFH9IAK8gL+Ti46Iar+6pqApcK
 4BCYYcXoBHBwvWKsPD5597LNc7KKIKEHvvwRsfIwL68cSWzJ2jriL/bEbbAKRFJtQrsvpSLCi
 HvIEUCjmfjxAZsjzPEBlfXH28ChJptlTRXAs3N88jWN6MPkP2Hl6/+Dciugf8b+ueuZmCoqZB
 9m7L1UuyA8MR8MPICKhkWF1M+jFjr3MWV2uC0w1YvmOxa+9YV6H+C29WCts05nlapo1xPZiyG
 fYGBp2yTgq8CUnLLiEOdzrMu9WOdH2XzfV9egf0G64Nt/AUgqGvxy6iTiHzhhEEI+I1VSpmHq
 wiUnrBYBIfbTfr8KAD1HhtktrZ0H2nn1lY6hK5CtCJCzQYggcCZwtw3FmzHcFVi5kjVKsvnZp
 RTsN3oB18mSMTp979jawGqA9ttK6bOp3XDtSuTPR+p9EbsOU9xjZ1zbhvV++pc3Wdsz4/OZbz
 KiLKa5PnAuNpjailDaz5VrbijUSbWmW6Pq3TOwD+n66+RvHUpq5dDPuxv0dDljWzSup7XkEeK
 9VAiJfA8/6OqCEHrWXPKZzil0/2ygL8Lx3BmgnSpg1y8DiMwKkzC5d88IuVkX0WfpdZHCIWP4
 f6d0FLPr7JfgME92AnC6emu5mZ0g6Ohv1SVyLfY/ZDDRRhBN4m4jwVkq5FhBAj35BUuqN6PeR
 XmQL3akHCIGqRZ0y/AeaWzTHbTRPVn6RngKyuA6wputxoMyDLLOlmcOfRcWulu/sEYAf0EK6x
 k5Tfq4FjotKRJOhQ3KyLJiO/H3urRstTPz+x0hI098S9fDihRtu6ZXCXUqTeouHSHA2pBSw==
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RESEND] HID: thrustmaster: fix memory leak
 in thrustmaster_interrupts()
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
LCBsZWFkaW5nCj4gdG8gYSBtZW1vcnkgbGVhay4KCldpbGwgeW91IGdldCBpbnRvIHRoZSBtb29k
IHRvIG1ha2Ugd29yZCB3cmFwcGluZyBvY2Nhc2lvbmFsbHkgYSBiaXQgbmljZXIKZm9yIHN1Y2gg
dGV4dCBsaW5lcyAod2hpY2ggbWF5IGJlIGxvbmdlciB0aGFuIDU5IGNoYXJhY3RlcnMpPwoKCuKA
pgo+ICsrKyBiL2RyaXZlcnMvaGlkL2hpZC10aHJ1c3RtYXN0ZXIuYwo+IEBAIC0xNzQsNiArMTc0
LDcgQEAgc3RhdGljIHZvaWQgdGhydXN0bWFzdGVyX2ludGVycnVwdHMoc3RydWN0IGhpZF9kZXZp
Y2UgKmhkZXYpCj4gIAl1OCBlcF9hZGRyWzJdID0ge2JfZXAsIDB9Owo+Cj4gIAlpZiAoIXVzYl9j
aGVja19pbnRfZW5kcG9pbnRzKHVzYmlmLCBlcF9hZGRyKSkgewo+ICsJCWtmcmVlKHNlbmRfYnVm
KTsKPiAgCQloaWRfZXJyKGhkZXYsICJVbmV4cGVjdGVkIG5vbi1pbnQgZW5kcG9pbnRcbiIpOwo+
ICAJCXJldHVybjsKPiAgCX0KCiogWW91IG1heSBhdm9pZCBzdWNoIHJlcGVhdGVkIGZ1bmN0aW9u
IGNhbGxzIGJ5IHVzaW5nIGFub3RoZXIgbGFiZWwgaW5zdGVhZC4KICBodHRwczovL3dpa2kuc2Vp
LmNtdS5lZHUvY29uZmx1ZW5jZS9kaXNwbGF5L2MvTUVNMTItQy4rQ29uc2lkZXIrdXNpbmcrYStn
b3RvK2NoYWluK3doZW4rbGVhdmluZythK2Z1bmN0aW9uK29uK2Vycm9yK3doZW4rdXNpbmcrYW5k
K3JlbGVhc2luZytyZXNvdXJjZXMjTUVNMTJDLkNvbnNpZGVydXNpbmdhZ290b2NoYWlud2hlbmxl
YXZpbmdhZnVuY3Rpb25vbmVycm9yd2hlbnVzaW5nYW5kcmVsZWFzaW5ncmVzb3VyY2VzLUNvbXBs
aWFudFNvbHV0aW9uKGNvcHlfcHJvY2VzcygpZnJvbUxpbnV4a2VybmVsKQoKKiBIb3cgZG8geW91
IHRoaW5rIGFib3V0IHRvIGJlbmVmaXQgYW55IG1vcmUgZnJvbSB0aGUgYXBwbGljYXRpb24gb2Yg
dGhlIGF0dHJpYnV0ZSDigJxfX2ZyZWXigJ0/CiAgaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMTQtcmM2L3NvdXJjZS9pbmNsdWRlL2xpbnV4L3NsYWIuaCNMNDcyCgoKUmVnYXJk
cywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
