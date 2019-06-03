Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46532A82
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 10:12:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73DA2C9DBDD
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 08:12:08 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B4B1C9DBDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 08:12:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u16so4736696wmc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jun 2019 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=rA1VCD3GAb0PD3btTSc5UgdukJM3iIv+UYfmDc9ijRY=;
 b=HGDr+SaPaEwwAm5phsdsWmtpxmne/TyhXv5ImfuOj5Gdkuffhte9CgCwbYvRoDlMGW
 cZe1B3eJ6guyNqvjTTos4JKJ0TZtV7wTXJdtoL28/uBddgf9sTiCHJSdgOpLl8/VQKl5
 6eS5cwBV47ZjOAXI3mPTXUF9k67RJEO44bMyXgZ0gq/lakJg9LeGdKiY0v2OHO2wrial
 nW6bjAV1pfhovdKC8wax7NwTLOArUb4g664DhmxNdX1OCjpYA8pU/UCUPGPtzEZa2g/G
 IPVzQy/MrRWfbHKXecWu7c0/BNRP8WBhgTUYJOPMmyAcJSMWFhN3DAsuYiiRfBgD8GBs
 O7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rA1VCD3GAb0PD3btTSc5UgdukJM3iIv+UYfmDc9ijRY=;
 b=c/fLGbUBsx+/0bYnOmtkVxdTEzZ3RN9t3dt/c84rFTyo1KJY+dPmx1uQwWbOKCZJRp
 e0/+zgltx0hnhVbBbbY9Val2D/wJg8Ut/JLz5xKpp6vtV3JMr8pA/wS1NeUXz7gcgFzM
 T/3zpZiHzsqTWySSXByVMXAByO7gGEi2KsYYMMXUCHBeOwayC9D/cM/D+LKrkZwuPT3I
 zECDMpDbwaFH4vKMj68WGkm/E4cfYnagxf2eb+3sLW7j9hIMxdAlPQZQFhVjr5y/kDRr
 Moh2izorjoBv+iCo40Eu5U0mmhU7tuLUhWPh2Ql37SwvFQLZbRZyKXWQUxpQWRwmhcTb
 eoLw==
X-Gm-Message-State: APjAAAW7DFDdv5yn1xxskT/sd2SOJ/O+UwzuRfxC6lgH8vcluZZHBXcu
 I5gweYMxetpmkfN+h8HxbyRfWA==
X-Google-Smtp-Source: APXvYqzs9kYOpuv0Oqi4vkNcyrdkKxl7+hada0n0FgsvyjwLdnHbT2Pjc30QWl9yRlT4LRH3YpsV6Q==
X-Received: by 2002:a1c:e356:: with SMTP id a83mr1365844wmh.38.1559549526778; 
 Mon, 03 Jun 2019 01:12:06 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id x83sm12809175wmb.42.2019.06.03.01.12.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 01:12:06 -0700 (PDT)
Date: Mon, 3 Jun 2019 09:12:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20190603081204.GG4797@dell>
References: <20190515093141.GA3409@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515093141.GA3409@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Uninitialized variable in
	stmfx_irq_handler()
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

T24gV2VkLCAxNSBNYXkgMjAxOSwgRGFuIENhcnBlbnRlciB3cm90ZToKCj4gVGhlIHByb2JsZW0g
aXMgdGhhdCBvbiA2NGJpdCBzeXN0ZW1zIHRoZW4gd2UgZG9uJ3QgY2xlYXIgdGhlIGhpZ2hlcgo+
IGJpdHMgb2YgdGhlICJwZW5kaW5nIiB2YXJpYWJsZS4gIFNvIHdoZW4gd2UgZG86Cj4gCj4gCWFj
ayA9IHBlbmRpbmcgJiB+QklUKFNUTUZYX1JFR19JUlFfU1JDX0VOX0dQSU8pOwo+IAlpZiAoYWNr
KSB7Cj4gCj4gdGhlIGlmIChhY2spIGNvbmRpdGlvbiByZWxpZXMgb24gdW5pbml0aWFsaXplZCBk
YXRhLiAgVGhlIGZpeCBpdCB0aGF0Cj4gSSd2ZSBjaGFuZ2VkICJwZW5kaW5nIiBmcm9tIGFuIHVu
c2lnbmVkIGxvbmcgdG8gYSB1MzIuICBJIGNoYW5nZWQgIm4iIGFzCj4gd2VsbCwgYmVjYXVzZSB0
aGF0J3MgYSBudW1iZXIgaW4gdGhlIDAtMTAgcmFuZ2UgYW5kIGl0IGZpdHMgZWFzaWx5Cj4gaW5z
aWRlIGFuIGludC4gIFdlIGRvIG5lZWQgdG8gYWRkIGEgY2FzdCB0byAicGVuZGluZyIgd2hlbiB3
ZSB1c2UgaXQgaW4KPiB0aGUgZm9yX2VhY2hfc2V0X2JpdCgpIGxvb3AsIGJ1dCB0aGF0IGRvZXNu
J3QgY2F1c2UgYSBwcm9ibGUsIGl0J3MKPiBmaW5lLgo+IAo+IEZpeGVzOiAwNjI1MmFkZTkxNTYg
KCJtZmQ6IEFkZCBTVCBNdWx0aS1GdW5jdGlvbiBlWHBhbmRlciAoU1RNRlgpIGNvcmUgZHJpdmVy
IikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL3N0bWZ4LmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpDb3VsZCBkbyB3aXRoIGFu
IGF1dGhvcidzIEFjayBoZXJlLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2Vy
dmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
