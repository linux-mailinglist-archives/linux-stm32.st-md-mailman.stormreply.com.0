Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC61345B0F
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Mar 2021 10:40:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8166AC57B5A;
	Tue, 23 Mar 2021 09:40:03 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB6A5C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Mar 2021 09:39:59 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id l18so14466462edc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Mar 2021 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VM6J50cuO11tHNrSpVMEPhTlVh0nXJYB1QWh6jX41x8=;
 b=ljIX33yEr+y8O/Km4ORjc6mpfKAzTKw7E0cIYwNv9D4+CTk92/dWTK8pNVyby0TD92
 r/WgLLXu2D/bfmC+KhRAZAGh9C/rGvicFTh6UwBCdlMnsO2rcHMxZ9S6N+lXOjh18o4J
 3uqKQ0ovd60NWl5nQ01pHI/PQMEMvBBmS6LT19KDWAabdB9J3Gs4TEue6ob5HiAUrQ/R
 QNrc/NfLdBo3cFk2gKJQTVpLW6QevvR3UFJWOCRwB5Bbe1rG1amFtjn2+Ws2aJkjCrku
 AC62Rh3GXbClZekjs+wTrd8c3oGZt8jSw4VuJmySUHRloEcPrz/fFcQK5gImMkR2ZtuD
 B27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VM6J50cuO11tHNrSpVMEPhTlVh0nXJYB1QWh6jX41x8=;
 b=K8al8j8LTLQIjPJaVe1MpOkeuck5lq0LKHJj/axP+9OZLPtbeBIXiMqe5rjc1IQ3Eb
 JHIM/9FajcxWMHKLy4O4HnbeA+hUITE4biJP/L+bvuxwPXDFrnsxa0ieE8aYhSKOT3Y8
 P2R/pskhQeusFenD6MG2NEC+WYDhUD5fLo1qsw8E6r26GLaVgcKYzAFdhvRWvHDHnEZm
 dg/CSolcX3oY/Cdfp/VrFLIW/AS7waO/n1rnmBRRVYwexATcjat0CJxWT18cu35TCqBN
 DUGWjQ2cy7pHNTLH53pHMiojcTvbM/cx/UEPQ8szNnEeP+ncuAxaZfKE7LoaWlKF6LA+
 NUAA==
X-Gm-Message-State: AOAM530XJxc8OtTJl7ltpeGfOMUmrQJQ5Q87XOpit5egtX+NKBIEi479
 z1BnL6789LpKa3Uxdt+7GSEQmw==
X-Google-Smtp-Source: ABdhPJxdvGM+6tcJUBAoHYZn+tISoI8Z3WDYAZL4H8IT3tFDossgdWDbo06ey4bSGaw1krADL34Q8g==
X-Received: by 2002:a05:6402:2058:: with SMTP id
 bc24mr3723646edb.243.1616492399245; 
 Tue, 23 Mar 2021 02:39:59 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id lx6sm10905544ejb.64.2021.03.23.02.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:39:58 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:39:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20210323093956.GS2916463@dell>
References: <1614793895-10504-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614793895-10504-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, vilhelm.gray@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stm32-timers: avoid clearing auto
	reload register
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

T24gV2VkLCAwMyBNYXIgMjAyMSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgoKPiBUaGUgQVJSIHJl
Z2lzdGVyIGlzIGNsZWFyZWQgdW5jb25kaXRpb25hbGx5IHVwb24gcHJvYmluZywgYWZ0ZXIgdGhl
IG1heGltdW0KPiB2YWx1ZSBoYXMgYmVlbiByZWFkLiBUaGlzIGluaXRpYWwgY29uZGl0aW9uIGlz
IHJhdGhlciBub3QgaW50dWl0aXZlLCB3aGVuCj4gY29uc2lkZXJpbmcgdGhlIGNvdW50ZXIgY2hp
bGQgZHJpdmVyLiBJdCByYXRoZXIgZXhwZWN0cyB0aGUgbWF4aW11bSB2YWx1ZQo+IGJ5IGRlZmF1
bHQ6Cj4gLSBUaGUgY291bnRlciBpbnRlcmZhY2Ugc2hvd3MgYSB6ZXJvIHZhbHVlIGJ5IGRlZmF1
bHQgZm9yICdjZWlsaW5nJwo+ICAgYXR0cmlidXRlLgo+IC0gRW5hYmxpbmcgdGhlIGNvdW50ZXIg
d2l0aG91dCBhbnkgcHJpb3IgY29uZmlndXJhdGlvbiBtYWtlcyBpdCBkb2Vzbid0Cj4gICBjb3Vu
dC4KPiAKPiBUaGUgcmVzZXQgdmFsdWUgb2YgQVJSIHJlZ2lzdGVyIGlzIHRoZSBtYXhpbXVtLiBT
byBDaG9pY2UgaGVyZQo+IGlzIHRvIGJhY2t1cCBpdCwgYW5kIHJlc3RvcmUgaXQgdGhlbiwgaW5z
dGVhZCBvZiBjbGVhcmluZyBpdHMgdmFsdWUuCj4gSXQgYWxzbyBmaXhlcyB0aGUgaW5pdGlhbCBj
b25kaXRpb24gc2VlbiBieSB0aGUgY291bnRlciBkcml2ZXIuCj4gCj4gRml4ZXM6IGQwZjk0OWUy
MjBmZCAoIm1mZDogQWRkIFNUTTMyIFRpbWVycyBkcml2ZXIiKQo+IAo+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL21mZC9zdG0zMi10aW1lcnMuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVl
IEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2
aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
