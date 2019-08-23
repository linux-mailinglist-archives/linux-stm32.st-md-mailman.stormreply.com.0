Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 614609E36D
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 10:58:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A7ECC1E9DC;
	Tue, 27 Aug 2019 08:58:32 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3543C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2019 14:08:36 +0000 (UTC)
Received: from [192.168.1.41] ([90.126.160.115]) by mwinf5d06 with ME
 id se8M200092Vh0YS03e8M18; Fri, 23 Aug 2019 16:08:36 +0200
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Aug 2019 16:08:36 +0200
X-ME-IP: 90.126.160.115
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, intel-wired-lan@lists.osuosl.org,
 bcm-kernel-feedback-list@broadcom.com, UNGLinuxDriver@microchip.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Allison Randal <allison@lohutok.net>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, Doug Berger <opendmb@gmail.com>,
 Douglas Miller <dougmill@linux.ibm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 Jilayne Lovejoy <opensource@jilayne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Kate Stewart <kstewart@linuxfoundation.org>
References: <af1ae1cf-4a01-5e3a-edc2-058668487137@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <4ab7f2a5-f472-f462-9d4c-7c8d5237c44e@wanadoo.fr>
Date: Fri, 23 Aug 2019 16:08:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af1ae1cf-4a01-5e3a-edc2-058668487137@web.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 27 Aug 2019 08:58:26 +0000
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32]
 =?utf-8?q?=5BPATCH=5D_ethernet=3A_Delete_unnecessar?=
 =?utf-8?q?y_checks_before_the_macro_call_=E2=80=9Cdev=5Fkfree=5Fskb?=
 =?utf-8?b?4oCd?=
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

SGksCgppbiB0aGlzIHBhdGNoLCB0aGVyZSBpcyBvbmUgcGllY2UgdGhhdCBsb29rZWQgYmV0dGVy
IGJlZm9yZS4gKHNlZSBiZWxvdykKClJlbW92aW5nIHRoZSAnaWYgKHNrYiknIGlzIGZpbmUsIGJ1
dCBjb25jYXRlbmluZyBldmVyeXRoaW5nIGluIG9uZSAKc3RhdGVtZW50IGp1c3QgdG8gc2F2ZSAy
IHZhcmlhYmxlcyBhbmQgYSBmZXcgTE9DIGlzIG9mIG5vIHVzZSwgSU1ITywgYW5kIAp0aGUgY29k
ZSBpcyBsZXNzIHJlYWRhYmxlLgoKanVzdCBteSAyYy4KCgpDSgoKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9icm9hZGNvbS9nZW5ldC9iY21nZW5ldC5jIApiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L2Jyb2FkY29tL2dlbmV0L2JjbWdlbmV0LmMKaW5kZXggZDNhMGI2MTRkYmZhLi44
YjE5ZGRjZGFmYWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Jyb2FkY29tL2dl
bmV0L2JjbWdlbmV0LmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvYnJvYWRjb20vZ2VuZXQv
YmNtZ2VuZXQuYwpAQCAtMjUxNSwxOSArMjUxNSwxNCBAQCBzdGF0aWMgaW50IGJjbWdlbmV0X2Rt
YV90ZWFyZG93bihzdHJ1Y3QgCmJjbWdlbmV0X3ByaXYgKnByaXYpCiDCoHN0YXRpYyB2b2lkIGJj
bWdlbmV0X2ZpbmlfZG1hKHN0cnVjdCBiY21nZW5ldF9wcml2ICpwcml2KQogwqB7CiDCoMKgwqDC
oCBzdHJ1Y3QgbmV0ZGV2X3F1ZXVlICp0eHE7Ci3CoMKgwqAgc3RydWN0IHNrX2J1ZmYgKnNrYjsK
LcKgwqDCoCBzdHJ1Y3QgZW5ldF9jYiAqY2I7CiDCoMKgwqDCoCBpbnQgaTsKCiDCoMKgwqDCoCBi
Y21nZW5ldF9maW5pX3J4X25hcGkocHJpdik7CiDCoMKgwqDCoCBiY21nZW5ldF9maW5pX3R4X25h
cGkocHJpdik7CgotwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBwcml2LT5udW1fdHhfYmRzOyBpKysp
IHsKLcKgwqDCoMKgwqDCoMKgIGNiID0gcHJpdi0+dHhfY2JzICsgaTsKLcKgwqDCoMKgwqDCoMKg
IHNrYiA9IGJjbWdlbmV0X2ZyZWVfdHhfY2IoJnByaXYtPnBkZXYtPmRldiwgY2IpOwotwqDCoMKg
wqDCoMKgwqAgaWYgKHNrYikKLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2tmcmVlX3NrYihz
a2IpOwotwqDCoMKgIH0KK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgcHJpdi0+bnVtX3R4X2Jkczsg
aSsrKQorIGRldl9rZnJlZV9za2IoYmNtZ2VuZXRfZnJlZV90eF9jYigmcHJpdi0+cGRldi0+ZGV2
LAorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJp
di0+dHhfY2JzICsgaSkpOwoKIMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBwcml2LT5od19wYXJh
bXMtPnR4X3F1ZXVlczsgaSsrKSB7CiDCoMKgwqDCoMKgwqDCoMKgIHR4cSA9IG5ldGRldl9nZXRf
dHhfcXVldWUocHJpdi0+ZGV2LCBwcml2LT50eF9yaW5nc1tpXS5xdWV1ZSk7Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
