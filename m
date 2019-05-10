Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA919FEF
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 17:16:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7FA8C9AE26
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 15:16:02 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36CCAC9AE23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 15:16:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so1907939wmo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 08:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=HNTqfGPCwHotSSFB/bs3NRxKL+FaiL/rv+Medyfbh88=;
 b=P9mrqU4+sESJPNllGdbaccCTv5uBF42euzxH8O6o8zHSGzXapBATU/ejvkoDYJd8pX
 6AJBVyP+RdkRIdNRvSa4EzWUeFPzAQShL4KAOw0t3O2xYe5xHu7M3H3ylRZTfAkpdvf2
 ue+dkzSeHV7jn0J84ADyxcL0PbUaXMbV8FwFURUkTQ4K2TFgvKyXk4HsgXm5u4/HZqJI
 HbpDbjtOV/p/ZxxNEI9efJL4OUiW5dqVY6gxO3PbOtSMc4BYqRlShapCRdVTHpknfn+c
 8h6L57V14ODLHHpOGw7A3c0Aj8/IMBuJZqjVBLF3NZ2/ROIyz8U83oRLNQ68NkPE71GJ
 8k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=HNTqfGPCwHotSSFB/bs3NRxKL+FaiL/rv+Medyfbh88=;
 b=Wq0DlD184h7Jpx3X6x75vpdfrdlCjydJ+/3VdrP+raiKCoZcmnV53zYmcDtGV0Ye89
 T3MHkIVDSz0cR7oH+Phw3IinamhfCGuqTBozLlJ3HEzYDvnEGORMPr3EsSumOshtZNKz
 RLp0TmWk8UdVGQTiqMHniPURd2d+fiGMwpwlpNsstklWKyFMbZnED4F3eRf9wdsJyuJZ
 9DHW281PoUVvCnrTCRX1+XA2Rbjg/d8gaqhwq3FSgMRD1U+EJTOVUB/ugDRPSU8HpGgW
 7BEhH8f3+TeStKoFwedqz5nXJr6gdQJIo7bi8QP8f+7/KcXJLj31yznh+KKjTq51zbgE
 Q1pw==
X-Gm-Message-State: APjAAAVBPPbaC6l/v/iU9zTCb9LCFqmPl50DDQYgOAN9HOIYnzEArQlv
 erFxajJ2R/WUEgY1WploR5pj8w==
X-Google-Smtp-Source: APXvYqwNcxQ+wZMQA6guBn6Potmx/LFX1w8O7OL3E3EWuj53qYCOqeHNdMVEJUOrPTEFTAuf9pvusQ==
X-Received: by 2002:a1c:14:: with SMTP id 20mr7907578wma.66.1557501360717;
 Fri, 10 May 2019 08:16:00 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id v189sm8817961wma.3.2019.05.10.08.15.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 08:15:59 -0700 (PDT)
Date: Fri, 10 May 2019 16:15:56 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190510151556.GA4319@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <20190510072314.GC7321@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510072314.GC7321@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [GIT PULL] Immutable branch between MFD and
 Pinctrl due for the v5.2 merge window
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

KiogQ29udGFpbnMgZml4IGZvciBpMzg2IGJ1aWxkIGJyZWFrYWdlICoqCgpFbmpveSEKClRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTkzYzljOTlhNjI5YzYxODM3ZDVhN2ZjMjEy
MGNkMmI2YzcwZGJkZDoKCiAgTGludXggNS4xICgyMDE5LTA1LTA1IDE3OjQyOjU4IC0wNzAwKQoK
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9sZWUvbWZkLmdpdCB0YWdzL2liLW1mZC1w
aW5jdHJsLXY1LjItMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDlhZjJkZTc2NTdm
NWE1MmY5ZTE1YWViYjZmOTM0OGY5YjhmMjUwYTY6CgogIHBpbmN0cmw6IEtjb25maWc6IEZpeCBT
VE1GWCBHUElPIGV4cGFuZGVyIFBpbmN0cmwvR1BJTyBkcml2ZXIgZGVwZW5kZW5jaWVzICgyMDE5
LTA1LTEwIDE2OjA5OjU2ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbW11dGFibGUgYnJhbmNoIGJldHdlZW4g
TUZEIGFuZCBQaW5jdHJsIGR1ZSBmb3IgdGhlIHY1LjIgbWVyZ2Ugd2luZG93CgpDb250YWlucyBm
aXggZm9yIGkzODYgYnVpbGQgYnJlYWthZ2UKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQW1lbGllIERlbGF1bmF5ICg1KToK
ICAgICAgZHQtYmluZGluZ3M6IG1mZDogQWRkIFNUIE11bHRpLUZ1bmN0aW9uIGVYcGFuZGVyIChT
VE1GWCkgY29yZSBiaW5kaW5ncwogICAgICBtZmQ6IEFkZCBTVCBNdWx0aS1GdW5jdGlvbiBlWHBh
bmRlciAoU1RNRlgpIGNvcmUgZHJpdmVyCiAgICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBkb2N1
bWVudCB0aGUgU1RNRlggcGluY3RybCBiaW5kaW5ncwogICAgICBwaW5jdHJsOiBBZGQgU1RNRlgg
R1BJTyBleHBhbmRlciBQaW5jdHJsL0dQSU8gZHJpdmVyCiAgICAgIHBpbmN0cmw6IEtjb25maWc6
IEZpeCBTVE1GWCBHUElPIGV4cGFuZGVyIFBpbmN0cmwvR1BJTyBkcml2ZXIgZGVwZW5kZW5jaWVz
CgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdG1meC50eHQgICAgfCAg
MjggKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLXN0bWZ4LnR4dCAg
fCAxMTYgKysrCiBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxMyArCiBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tZmQvc3RtZnguYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA1NDUgKysrKysrKysrKysrKysKIGRyaXZlcnMvcGluY3RybC9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE0ICsKIGRyaXZlcnMvcGluY3RybC9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvcGluY3RybC9w
aW5jdHJsLXN0bWZ4LmMgICAgICAgICAgICAgICAgICAgIHwgODIwICsrKysrKysrKysrKysrKysr
KysrKwogaW5jbHVkZS9saW51eC9tZmQvc3RtZnguaCAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxMjMgKysrKwogOSBmaWxlcyBjaGFuZ2VkLCAxNjYxIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3N0bWZ4LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtc3RtZngudHh0CiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9tZmQvc3RtZnguYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3Ry
bC9waW5jdHJsLXN0bWZ4LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9z
dG1meC5oCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmlj
YWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
