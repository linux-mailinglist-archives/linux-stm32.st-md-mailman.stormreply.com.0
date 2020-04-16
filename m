Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B68F41AB93E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 09:03:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74685C36B0C;
	Thu, 16 Apr 2020 07:03:52 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 353F5C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 07:03:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r26so3604430wmh.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AruXxjr9GHlZ2Z9Tv42XPGLrf7MP2PtB4f9OTEBH4MM=;
 b=VAFOtuQzGjjh1BpnjdwrBb8ATOf9hLIQMepMrNF2THjStFG8m/qucMONexKM/Ibh0E
 XnkPy+lPDXG4ZLFC0CUaOGOAsEj1n4I0cqOGjjq2UtVhoTGbcvAy14ISFMKTzA6o7JZB
 erM05v8TzGUWzuAZDgeE6K0dy3boHLEmcgO8mqrTXpiSO+J/eJ2v4+FPMkRt4eAvIUvn
 wEL/CDEmrhNzU/AhUYaUhPQK+gwDwngk88DYkCqM+/uO8cyxAE/LzNoRMnuA9Pr5u5KL
 r5cFfhRBHKjkgpMV9vagPW6RZY70RwX0WgU2wxq3vBZPk9De1qT0f9Og4VBs/JWNT5hu
 rmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AruXxjr9GHlZ2Z9Tv42XPGLrf7MP2PtB4f9OTEBH4MM=;
 b=V5BZAi6d5UPpiarm/AKOKTmEMwZ8e3SCG1DrdIBmQIxKOWTimrVTVQ4TAscsf9PwzU
 9N/5ueU01MZOUU3g9ko/zuaG+uykeWwgmKM7Z79cyeMtMMuHH+aJ1Csi3mHoCuFm0L4z
 +USFFyqJhOoYhXsfXMDzS1SLZ6yLlKIJk2TxEvYMphKD2pYaqqs3FaNhrt1vAl1eI03c
 TDX54e962JxhaBD4C/8sInWkO0MdD541h0RQds6XVazMCb8e/4kwFN/JG6X4ls9kwN8p
 7QZhNSb18Vquj25jfsf7Ve5aDxFJw72nllKh7WYJHonC5H/AKPqyWstK1LBi81vXHcuR
 t29w==
X-Gm-Message-State: AGi0PuYXLb2v0mhSa8NbDcnXPtJKIMHyToAgz0YSXYtox5yAYnlAY5oK
 wqtYnX4Juy3l05qb1RBAmHk1aA==
X-Google-Smtp-Source: APiQypK1dMnBZLZOHx8PctsABj5RlziysLlkiXO8f0byNomGW94UpABYhu4MUL2N+fcrhwskc4rKnw==
X-Received: by 2002:a1c:9a96:: with SMTP id c144mr3289606wme.84.1587020630466; 
 Thu, 16 Apr 2020 00:03:50 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id w18sm25908396wrn.55.2020.04.16.00.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 00:03:49 -0700 (PDT)
Date: Thu, 16 Apr 2020 08:04:41 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200416070441.GP2167633@dell>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401083909.18886-1-benjamin.gaignard@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 0/6] clockevent: add low power STM32
	timer
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

T24gV2VkLCAwMSBBcHIgMjAyMCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cgo+IFRoaXMgc2Vy
aWVzIGFkZCBsb3cgcG93ZXIgdGltZXIgYXMgYm9hZGNhc3QgY2xvY2tldmVudCBkZXZpY2UuCj4g
TG93IHBvd2VyIHRpbWVyIGNvdWxkIHJ1bnMgZXZlbiB3aGVuIENQVXMgYXJlIGluIGlkbGUgbW9k
ZSBhbmQgCj4gY291bGQgd2FrZXVwIHRoZW0uCj4gCj4gdmVyc2lvbiA2Ogo+IC0gc2ltcGxpZnkg
YmluZGluZywgRFQgYW5kIGNvZGUgdG8gdXNlIG9ubHkgb25lIGludGVycnVwdAo+IAo+IHZlcnNp
b24gNToKPiAtIGRvY3VtZW50IGludGVycnVwdHMgYW5kIGludGVycnVwdC1uYW1lcyBiaW5kaW5n
cwo+IC0gdXNlIGEgZGlmZmVyZW50IHdha2UgdXAgaW50ZXJydXB0Cj4gLSBhZGQgZGV2aWNlLXRy
ZWUgcGF0Y2gKPiAtIG1ha2UgU1RNMzJNUDE1NyBzZWxlY3QgbG93IHBvd2VyIHRpbWVyIGNvbmZp
Z3VyYXRpb24gZmxhZwo+IC0gZW5hYmxlIGZhc3RfaW8gaW4gcmVnbWFwIGNvbmZpZ3VyYXRpb24K
PiAKPiB2ZXJzaW9uIDQ6Cj4gLSBtb3ZlIGRlZmluZXMgaW4gbWZkL3N0bTMyLWxwdGltZXIuaAo+
IC0gY2hhbmdlIGNvbXBhdGlibGUgYW5kIHN1Ym5vZGUgbmFtZXMKPiAtIGRvY3VtZW50IHdha2V1
cC1zb3VyY2UgcHJvcGVydHkKPiAtIHJld29yZCBjb21taXQgbWVzc2FnZQo+IC0gbWFrZSBkcml2
ZXIgS2NvbmZpZyBkZXBlbmRzIG9mIE1GRF9TVE0zMl9MUFRJTUVSCj4gLSByZW1vdmUgdXNlbGVz
cyBpbmNsdWRlCj4gLSByZW1vdmUgcmF0ZSBhbmQgY2xrIGZpZWxkcyBmcm9tIHRoZSBwcml2YXRl
IHN0cnVjdHVyZQo+IC0gdG8gYWRkIGNvbW1lbnRzIGFib3V0IHRoZSByZWdpc3RlcnMgc2VxdWVu
Y2UgaW4gc3RtMzJfY2xrZXZlbnRfbHBfc2V0X3RpbWVyCj4gLSByZXdvcmsgcHJvYmUgZnVuY3Rp
b24gYW5kIHVzZSBkZXZtX3JlcXVlc3RfaXJxKCkKPiAtIGRvIG5vdCBhbGxvdyBtb2R1bGUgdG8g
YmUgcmVtb3ZlZAo+IAo+IHZlcnNpb24gMzoKPiAtIGZpeCB0aW1lciBzZXQgc2VxdWVuY2UKPiAt
IGRvbid0IGZvcmdldCB0byBmcmVlIGlycSBvbiByZW1vdmUgZnVuY3Rpb24KPiAtIHVzZSBkZXZt
X2t6YWxsb2MgdG8gc2ltcGxpZnkgZXJyb3JzIGhhbmRsaW5nIGluIHByb2JlIGZ1bmN0aW9uCj4g
Cj4gdmVyc2lvbiAyOgo+IC0gc3RtMzIgY2xrZXZlbnQgZHJpdmVyIGlzIG5vdyBhIGNoaWxkIG9m
IHRoZSBzdG0zMiBscCB0aW1lciBub2RlCj4gLSBhZGQgYSBwcm9iZSBmdW5jdGlvbiBhbmQgYWRw
YXQgdGhlIGRyaXZlciB0byB1c2UgcmVnbWFwIHByb3ZpZGUKPiAgIGJ5IGl0IHBhcmVudAo+IC0g
c3RvcCB1c2luZyB0aW1lcl9vZiBoZWxwZXJzCj4gCj4gCj4gQmVuamFtaW4gR2FpZ25hcmQgKDYp
Ogo+ICAgZHQtYmluZGluZ3M6IG1mZDogRG9jdW1lbnQgU1RNMzIgbG93IHBvd2VyIHRpbWVyIGJp
bmRpbmdzCj4gICBBUk06IGR0czogc3RtMzI6IEFkZCB0aW1lciBzdWJub2RlcyBvbiBzdG0zMm1w
MTUgU29Dcwo+ICAgbWZkOiBzdG0zMjogQWRkIGRlZmluZXMgdG8gYmUgdXNlZCBmb3IgY2xrZXZl
bnQgcHVycG9zZQo+ICAgbWZkOiBzdG0zMjogZW5hYmxlIHJlZ21hcCBmYXN0X2lvIGZvciBzdG0z
Mi1scHRpbWVyCj4gICBjbG9ja3NvdXJjZTogQWRkIExvdyBQb3dlciBTVE0zMiB0aW1lcnMgZHJp
dmVyCj4gICBBUk06IG1hY2gtc3RtMzI6IHNlbGVjdCBsb3cgcG93ZXIgdGltZXIgZm9yIFNUTTMy
TVAxNTcKPiAKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLWxwdGltZXIu
eWFtbCAgfCAgMjEgKysKPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNpICAgICAg
ICAgICAgICAgICAgfCAgMzUgKysrKwo+ICBhcmNoL2FybS9tYWNoLXN0bTMyL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsKPiAgZHJpdmVycy9jbG9ja3NvdXJjZS9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL2Nsb2Nrc291
cmNlL3RpbWVyLXN0bTMyLWxwLmMgICAgICAgICAgICAgICB8IDIyMSArKysrKysrKysrKysrKysr
KysrKysKPiAgZHJpdmVycy9tZmQvc3RtMzItbHB0aW1lci5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9zdG0zMi1scHRpbWVyLmggICAgICAgICAg
ICAgICAgICB8ICAgNSArCgpJJ2QgYmUgaGFwcHkgdG8gdGFrZSB0aGlzIHNldCwgYnV0IHlvdSBu
ZWVkIEFja3MgZnJvbSB0aGUgb3RoZXIKc3Vic3lzdGVtIE1haW50YWluZXJzIGJlZm9yZSBJIGNh
biBkbyBzby4KCj4gIDggZmlsZXMgY2hhbmdlZCwgMjg5IGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYwo+IAoKLS0g
CkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5h
cm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
