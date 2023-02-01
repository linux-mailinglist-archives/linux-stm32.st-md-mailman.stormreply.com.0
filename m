Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E8B686422
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Feb 2023 11:25:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47381C6904B;
	Wed,  1 Feb 2023 10:25:16 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F343C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Feb 2023 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=To:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=rYkvomKGi0Jf8vL6lvpAW6MC8L3j2zw9eum1VJ+uKq8=; b=MQVzAlfocI/+tQTyh3gPPuBsIV
 5xrUe5vroLJpK7EyU8Ykvr7ZVDIhalOPAefh4BACGTHaw1bvEoVApjsZ0tJKMDUR9uOxKfMLbH2a+
 CDB1SAFpKaqtEcT9UuHYsZCUPWBHVKCvfHTNE4pDZVxdDwUybjHUsV8AXBAq93GKU+G78YJ8F3KK8
 uzQY7m9dggrfmZ0acr+fjDZ86vwRzY1IkDVt/21UrVmHkDuh6I953Jh3OfR5Hf+I/SPHa/6z1eNYY
 j7s5DPqAa3yP5o2wlWc3Vab+Ah7i7bePfjCNSa8k5oL/y3eY9HseazXsNq27vmOGorFW2yPzrI/tV
 Ed1zYJ8w==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1pNAIh-000PiW-Ja; Wed, 01 Feb 2023 11:25:12 +0100
Received: from [185.17.218.86] (helo=smtpclient.apple)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1pNAIh-0002fn-RZ; Wed, 01 Feb 2023 11:25:11 +0100
From: =?utf-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Message-Id: <36B1D79F-1CF0-467C-A65F-5CA5A2174BC0@geanix.com>
Date: Wed, 1 Feb 2023 11:25:01 +0100
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26799/Wed Feb  1 09:42:06 2023)
Subject: [Linux-stm32] STM32MP1 Backup registers
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

SGkgbGlzdCwKCldlIGFyZSB1c2luZyB0aGUgdS1ib290ICJib290IGNvdW50IiBmZWF0dXJlIHRv
IHN0b3JlIHRoZSBib290IGNvdW50IGluIHRoZSBUQU1QIHJlZ2lzdGVyIEJPT1RfQ09VTlRFUi4K
CklmIEkgZXhwb3J0IHRoZSByZWdpc3RlciB2aWEgdGhlIHNyYW0gZHJpdmVyIHdlIGNhbiByZXNl
dCBpdCAod2hlbiBldmVyeXRoaW5nIGdvZXMgd2VsbCkuCmRldmljZXRyZWUgZGlmZjoKKyZzb2Mg
eworICAgICAgIHNyYW06IHNyYW1ANWMwMGExMDAgeworICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJtbWlvLXNyYW0iOworICAgICAgICAgICAgICAgcmVnID0gPDB4NWMwMGExMDAgMHgxMDA+
OworICAgICAgICAgICAgICAgcmFuZ2VzID0gPDAgMHg1YzAwYTEwMCAweDEwMD47CisgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDE+OworCisgICAgICAgICAgICAgICBib290Y291bnRANTQgeworICAgICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MHg1NCAweDQ+OworICAgICAgICAgICAgICAgICAgICAgICBleHBvcnQ7
CisgICAgICAgICAgICAgICB9OworICAgICAgIH07Cit9OwoKQnV0IHRoZSBtZW1vcnkgcmFuZ2Ug
aXMgYWxyZWFkeSB1c2VkIGJ5IHRoZSAic3Qsc3RtMzItdGFtcOKAnSBlbnRyeS4KQXQgc29tZSBw
b2ludCB3ZSB3YW50IHRvIHVzZSB0aGUgbTTigJlzLCBzbyBJIGd1ZXNzIG15IHNvbHV0aW9uIHdv
buKAmXQgd29yayB0aGVyZS4KCldoYXQgYXJlIHRoZSB0aG91Z2h0cyBhYm91dCB0aGlzPyBBbmQg
d2hhdCBpcyB0aGUgcHJlZmVycmVkIHdheSBvZiByZXNldGluZyB0aGUgYm9vdCBjb3VudGVyPwpJ
4oCZbSB0aGlua2luZyBhYm91dCBkb2luZyBhbiBzeXNjb24gZHJpdmVyIGZvciB0aGlzLCBjb3Vs
ZCB0aGF0IGJlIGFuIGlkZWE/CgpCciwKL1NlYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
