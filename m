Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57549BD4
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 10:16:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F55C07A55
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2019 08:16:50 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52647C06FAE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 08:16:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so2142141wme.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=t/jrlwVbqUGm5LlxED/u8lqvV/TkMHlvG38VrHjMZwM=;
 b=LTei/vPtrKAGo+xiHG938K3xZdc34NOswQ0WZSU7et3BB+FoPlGssMxDzK6esyJSja
 QNoCDNSmTtY1kYZ1bly52+mKA135BDgOFFA6ugJ699DK43sih5uZp8XmvqgIr+LwLRtk
 LPQlyeWJ2hkr5rgaRT3CHorvxpilQW6OvrXFYHyeM1Viz545C2V/QhgMdcVGGVXI3p1d
 JTe27YjN3ZmjGvr6csX7WB6FYvbN1ywUAEKWlDIZg22hBeQ/qkQ+mp//G8FEvqKVaUFE
 tbHm6TLstQTl3vkr+1CBDxhm29P4fndqXWdxYbLcVb9eQQ32K3+qQc04c3/L600uA6Kx
 ezmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=t/jrlwVbqUGm5LlxED/u8lqvV/TkMHlvG38VrHjMZwM=;
 b=rhr77hd7/SNJ6Bg4GrQQGe20vl0rVfJHdHsab9+3B8mNHQDkkZjXY6O470+jU3bYWB
 utYwypPMsTHWY96G9lUjOJdlT8yOYB5G4bEb/YZzBgAXhYzpAg7AL7p9GHkcQf6qmQOv
 qxoe5djgbqM3nBfHoyxf5X98k5p1rW1s8xqFMUh68lbgmevF+kx3YN7TxterHc/4Am/A
 E3OZylMpblaWXaA7PWVoGLjoW0K6YiGCRQLJFTNx4LkbXaEQ5qcBY7ftBakfUm+mzCsM
 fDJyJ4iM2mwhZbNyG8fCpmnItdVQBSB+JZquiHMyFp17JjDlkZ05wdelTKASS6Vyj+sQ
 h84A==
X-Gm-Message-State: APjAAAWOZr2vPvlraASG6LFHSMkAmgwjDNK7lYsoFp+1UesTYmM5b8Br
 QLe4Ug+tXl5jshUfYSA0OAXOCA==
X-Google-Smtp-Source: APXvYqwYTr5x7DrdrPoLH+qfq4DTqLezqkCP1jdXSp6iYQxgp2pEEprK6f3SFvlWPAjwHdlqgPP9mw==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr2318494wmg.112.1560845807845; 
 Tue, 18 Jun 2019 01:16:47 -0700 (PDT)
Received: from dell ([2.27.35.243])
 by smtp.gmail.com with ESMTPSA id k125sm2847763wmf.41.2019.06.18.01.16.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 01:16:47 -0700 (PDT)
Date: Tue, 18 Jun 2019 09:16:45 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20190618081645.GM16364@dell>
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617190605.GA21332@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Amelie Delaunay <amelie.delaunay@st.com>, kernel-janitors@vger.kernel.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix an endian bug in
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

T24gTW9uLCAxNyBKdW4gMjAxOSwgRGFuIENhcnBlbnRlciB3cm90ZToKCj4gSXQncyBub3Qgb2th
eSB0byBjYXN0IGEgInUzMiAqIiB0byAidW5zaWduZWQgbG9uZyAqIiB3aGVuIHlvdSBhcmUKPiBk
b2luZyBhIGZvcl9lYWNoX3NldF9iaXQoKSBsb29wIGJlY2F1c2UgdGhhdCB3aWxsIGJyZWFrIG9u
IGJpZwo+IGVuZGlhbiBzeXN0ZW1zLgo+IAo+IFJlcG9ydGVkLWJ5OiBMaW51cyBUb3J2YWxkcyA8
dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+CgpJZGVhbGx5IHdlIGNhbiBnZXQgYSByZXZp
ZXcgdG9vLgoKPiBGaXhlczogMzg2MTQ1NjAxYjgyICgibWZkOiBzdG1meDogVW5pbml0aWFsaXpl
ZCB2YXJpYWJsZSBpbiBzdG1meF9pcnFfaGFuZGxlcigpIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZk
L3N0bWZ4LmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zdG1meC5jIGIvZHJpdmVy
cy9tZmQvc3RtZnguYwo+IGluZGV4IDdjNDE5YzA3ODY4OC4uODU3OTkxY2IzY2JiIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbWZkL3N0bWZ4LmMKPiArKysgYi9kcml2ZXJzL21mZC9zdG1meC5jCj4g
QEAgLTIwNCw2ICsyMDQsNyBAQCBzdGF0aWMgc3RydWN0IGlycV9jaGlwIHN0bWZ4X2lycV9jaGlw
ID0gewo+ICBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtZnhfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9p
ZCAqZGF0YSkKPiAgewo+ICAJc3RydWN0IHN0bWZ4ICpzdG1meCA9IGRhdGE7Cj4gKwl1bnNpZ25l
ZCBsb25nIGJpdHM7Cj4gIAl1MzIgcGVuZGluZywgYWNrOwo+ICAJaW50IG4sIHJldDsKPiAgCj4g
QEAgLTIyMiw3ICsyMjMsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtZnhfaXJxX2hhbmRsZXIo
aW50IGlycSwgdm9pZCAqZGF0YSkKPiAgCQkJcmV0dXJuIElSUV9OT05FOwo+ICAJfQo+ICAKPiAt
CWZvcl9lYWNoX3NldF9iaXQobiwgKHVuc2lnbmVkIGxvbmcgKikmcGVuZGluZywgU1RNRlhfUkVH
X0lSUV9TUkNfTUFYKQo+ICsJYml0cyA9IHBlbmRpbmc7Cj4gKwlmb3JfZWFjaF9zZXRfYml0KG4s
ICZiaXRzLCBTVE1GWF9SRUdfSVJRX1NSQ19NQVgpCj4gIAkJaGFuZGxlX25lc3RlZF9pcnEoaXJx
X2ZpbmRfbWFwcGluZyhzdG1meC0+aXJxX2RvbWFpbiwgbikpOwo+ICAKPiAgCXJldHVybiBJUlFf
SEFORExFRDsKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2hu
aWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
