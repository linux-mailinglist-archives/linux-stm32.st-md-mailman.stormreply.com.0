Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF261E1CB3
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 09:59:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14F73C36B23;
	Tue, 26 May 2020 07:59:08 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2B25C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 07:59:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y17so11025847wrn.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zYdjgpNGKkhHUaPVM1/nhRkNBCVbxfKW4NHkKWtwJ2Y=;
 b=n/dXU9fyQ+2u0G9SXzRKn0Sd6pJTChNHgO3T/qJJlCgWgMb4CS573tIEQx+xoycpt5
 ZH5fEO/STnba6a5noZgK+uleLYZg24fRK4RpI+M93bAfb7iWvfyTECnKeAx3Hs1Nyy8z
 3k6qYlbQlDVjbj7whcev/TQosfr+iCL0jQikOosi/J4RO2+fyTg6NguWXboOJsI/tsAm
 8p2GrWuV0sCQbUNji569BEikqLrJI2tJSONaEZf5CDhmIWZwRenMEDB1rC10eiprVUO7
 djKXcWdnhf+v+kzsegrbQjmBD4aVi//DZxmrvgOt1Z4TYdJ9h3i+v/dLSIU26jWEA2gk
 sp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zYdjgpNGKkhHUaPVM1/nhRkNBCVbxfKW4NHkKWtwJ2Y=;
 b=pupp6fEf+L4Ly4j181SivEvhF+X+M9lZ1FhPRUqw67cwlF6VufKvD1fifS7eIEuOOw
 Bm/kJPvJi+9GofEH1KyFQoBTHNerZvjPjtK4ryAPolrpP0TLDR4ZP8Vas+6Tgm9nHVGp
 JfV/klQDxbd78N8XgcXhVXS1XjHFsAM5gZfhZKIc4ewkc7DrZ/JvWGJKzpLGKsZVuQpF
 9S/7EDnDBgCu5RJ+67IkRdSpwv6eA1Dx9El4oNb6xq6z27vh1HbEgUP/3E0/Ji6KNoQk
 jfTo+OVbhtctUpYxPpqT0qmgBoh7wKBolxyPxVc/IXo56i483PMcNwvrW0F2kBZgcojn
 2VCw==
X-Gm-Message-State: AOAM533FdDCceU9vyiYu3BUkyVs+OYUY19S4PWcWKPIDoIIBiMLuWcR/
 JlqwyuOTcKE+MXX/cSznbYqeVw==
X-Google-Smtp-Source: ABdhPJzjh8siprJLpdOwjtzMP60lf7tTZJoWmJAVMzTka0tpDJqO/GhIRtY1OB3npRBX5C5TYEDnUw==
X-Received: by 2002:adf:a51c:: with SMTP id i28mr1970108wrb.78.1590479943335; 
 Tue, 26 May 2020 00:59:03 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id d6sm22344913wrj.90.2020.05.26.00.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:59:02 -0700 (PDT)
Date: Tue, 26 May 2020 08:59:01 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200526075901.GG3628@dell>
References: <20200422090833.9743-1-amelie.delaunay@st.com>
 <20200422090833.9743-4-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422090833.9743-4-amelie.delaunay@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] mfd: stmfx: disable irq in suspend to
 avoid spurious interrupt
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

T24gV2VkLCAyMiBBcHIgMjAyMCwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBXaGVuIFNUTUZY
IHN1cHBseSBpcyBzdG9wcGVkLCBzcHVyaW91cyBpbnRlcnJ1cHQgY2FuIG9jY3VyLiBUbyBhdm9p
ZCB0aGF0LAo+IGRpc2FibGUgdGhlIGludGVycnVwdCBpbiBzdXNwZW5kIGJlZm9yZSBkaXNhYmxp
bmcgdGhlIHJlZ3VsYXRvciBhbmQKPiByZS1lbmFibGUgaXQgYXQgdGhlIGVuZCBvZiByZXN1bWUu
Cj4gCj4gRml4ZXM6IDA2MjUyYWRlOTE1NiAoIm1mZDogQWRkIFNUIE11bHRpLUZ1bmN0aW9uIGVY
cGFuZGVyIChTVE1GWCkgY29yZSBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxh
dW5heSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvc3RtZngu
YyAgICAgICB8IDYgKysrKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL3N0bWZ4LmggfCAxICsKPiAg
MiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
