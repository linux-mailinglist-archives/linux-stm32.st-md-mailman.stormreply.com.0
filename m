Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9AF1FEF8F
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2020 12:21:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8525CC36B0D;
	Thu, 18 Jun 2020 10:21:57 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DE38C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 10:21:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l11so5483645wru.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lc5UhnoSRIFlDb4bTQaq1FSaNFdyYRNankkKgGtxJsM=;
 b=QPX3pcoULeRgdl8S5TEBqcc2VmR03uompZGl6g1kKu/NL/Em080sZdrASGWlK2EQRg
 iUYJsnXXUuP2l5H7lghNfhm6e7DfDZB8JWnUn/tbYdwvBsdWpJxLgaxEnYJHjgnzgMpw
 3mFqngduzWwpciQJbBRQ6kl7j45e0UBKM1hAa1EJYMHfJvlYzWJ//F47grKwJm5rybRQ
 CCUxDrkozG6yAeZhvuCKl0HwzlLaxg+lYcM2Su9Ry8rFRDbWNCkQQcs5sjzzUtuat/iC
 sbbBUI9tpgXk8vu/WmvuTSBlogl7qf38y/XHzRnS5x0dXCCEbTe/9v2vRKE8Acmh3sOQ
 PRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lc5UhnoSRIFlDb4bTQaq1FSaNFdyYRNankkKgGtxJsM=;
 b=YzsMbfzfwM4RRXuD0mMKXS9pxrO9Wep/f/mucaPvFTT6eQ7zQ3dPMKm+vMJaz5vgVT
 UlKffWARu/m9QzplMlu64i5UBF49qJSvjApGCxqhvhJshIXFsb3CMmqhYAksTILbJKI3
 EhdUeSaRgFkos5NGCszGMMdCpBDSTd+V3366CDcM7lasy3/TN+7agihEsyTng+FzANJ0
 cUyu64qTImNrUrKUR778fcgeopCAyx2unxIyaRA3tH5VzGvlsomFUAqpSXBzaXQP3aPl
 t+JeBQWQRZJiRH48HM2GIvkJQmwK0ud9sEYfQ57WjlfscZ3BZUFeEpfJhXnPNN9gVQnu
 z1ng==
X-Gm-Message-State: AOAM532qrLX19s8pyB7yiwxdDiNxi7nGvzy8MlmZlX2wofxJzYxAvl/e
 s5JkEdIs9Gik8uf7uv/aZIKYdw==
X-Google-Smtp-Source: ABdhPJz5DhYnsCs3A52DCuEOd991w1DHFP+dRXEye2MKbtUEcRSXIjOpqlaA34AoVsAb5kpvszgzgA==
X-Received: by 2002:adf:e588:: with SMTP id l8mr4057736wrm.255.1592475715609; 
 Thu, 18 Jun 2020 03:21:55 -0700 (PDT)
Received: from dell ([95.149.164.118])
 by smtp.gmail.com with ESMTPSA id h188sm3145127wmh.2.2020.06.18.03.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 03:21:54 -0700 (PDT)
Date: Thu, 18 Jun 2020 11:21:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200618102153.GF954398@dell>
References: <20200603125439.23275-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603125439.23275-1-benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, tglx@linutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [GIT PULL] Immutable branch between MFD and
 Clocksource due for the v5.9 merge window
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

QWxsIGJ1dCB0aGUgQVJNIHBhdGNoZXMsIHdoaWNoIHNob3VsZCBiZSByb3V0ZWQgdmlhIEFybS1T
b0MuCgpFbmpveSEKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjNhOWUzYjk2
MjJhZTEwMDY0ODI2ZGNjYjRmN2E1MmJkODhjNzQwNzoKCiAgTGludXggNS44LXJjMSAoMjAyMC0w
Ni0xNCAxMjo0NTowNCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGVl
L21mZC5naXQgaWItbWZkLWNsb2Nrc291cmNlLXY1LjkKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byA0OGI0MWM1ZTJkZTZjNTJjOTBlZmE5OWNmYTEyMmE1ZGE3YTdmMGNkOgoKICBjbG9j
a3NvdXJjZTogQWRkIExvdyBQb3dlciBTVE0zMiB0aW1lcnMgZHJpdmVyICgyMDIwLTA2LTE4IDEx
OjE5OjU4ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbW11dGFibGUgYnJhbmNoIGJldHdlZW4gTUZEIGFuZCBD
bG9ja3NvdXJjZSBkdWUgZm9yIHRoZSB2NS45IG1lcmdlIHdpbmRvdwoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpCZW5qYW1p
biBHYWlnbmFyZCAoNCk6CiAgICAgIGR0LWJpbmRpbmdzOiBtZmQ6IERvY3VtZW50IFNUTTMyIGxv
dyBwb3dlciB0aW1lciBiaW5kaW5ncwogICAgICBtZmQ6IHN0bTMyOiBBZGQgZGVmaW5lcyB0byBi
ZSB1c2VkIGZvciBjbGtldmVudCBwdXJwb3NlCiAgICAgIG1mZDogc3RtMzI6IEVuYWJsZSByZWdt
YXAgZmFzdF9pbyBmb3Igc3RtMzItbHB0aW1lcgogICAgICBjbG9ja3NvdXJjZTogQWRkIExvdyBQ
b3dlciBTVE0zMiB0aW1lcnMgZHJpdmVyCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0
LHN0bTMyLWxwdGltZXIueWFtbCAgfCAgIDUgKwogZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwogZHJpdmVycy9jbG9ja3NvdXJjZS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9jbG9ja3NvdXJjZS90
aW1lci1zdG0zMi1scC5jICAgICAgICAgICAgICAgfCAyMjEgKysrKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL21mZC9zdG0zMi1scHRpbWVyLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArCiBpbmNsdWRlL2xpbnV4L21mZC9zdG0zMi1scHRpbWVyLmggICAgICAgICAgICAgICAgICB8
ICAgNSArCiA2IGZpbGVzIGNoYW5nZWQsIDIzNyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdG0zMi1scC5jCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
