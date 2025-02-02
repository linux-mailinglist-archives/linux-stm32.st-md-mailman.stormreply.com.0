Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA51A24DF5
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Feb 2025 13:25:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03FE7C78039;
	Sun,  2 Feb 2025 12:25:44 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 005ADC78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Feb 2025 12:25:36 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-21680814d42so55601655ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Feb 2025 04:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738499135; x=1739103935;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uETwJAYLiI++YAvvMckAL69wPehGQ7drAEjc1+6UWe4=;
 b=UsmV5wmaapVBmCUPI615fdf5GzFAWWsb5ltcarQnwGWBadfDBWlFzUyTXcoqfrHvkD
 y9b1MRdxla6bfjmMyUEp8xgFtu/W4T+0N2lz+Sbb6nKTGCLeDeDyWlwcnvCvPdeTNqfo
 oJbFRRELGDZefSdPpAcJ7Eh8VwmtFevUfg2R1ezfkEdpBCcUr1Crlk+5PPcwFA//UtfN
 IGM/jMGQ75fsPglpb9w+3HHAOyU1c/Ivmh20cesX7DHA0K1o3fw+wPFU+I4gJ4MIHpwE
 w1uZcdKLQ8ZlO1R+Yp2cOH5Uspq5WpBxsfXWMnj5ABCxtEFAcr+68XahQY7gQsztYhIt
 +Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738499135; x=1739103935;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uETwJAYLiI++YAvvMckAL69wPehGQ7drAEjc1+6UWe4=;
 b=HpaivKYbTMzfKFhChCuNq/Jz750XN6dWHCTHMTCvgOdnoAashpLY3RrTLbFP6rpDX6
 DNY/8815DPw8GduTNRn4XLboE0lSHGahEJ27jcZaO7MCmEO4UJysdGF29KdD5T5NU/u+
 eitrhpHzexvR7pxiJLEWxOdbBwfXJX63mmxv7kfBZfbR8syox9quIlV+lYRC6bXtYcMo
 nHwJSMFBRNTduuXuomVPKr9qbhgF02RdoK492WlrhRvgWsgzvKFcUtPKZ9Jb1BqDeCWC
 WWUrt/WQrIKsGHjPzViTL4Tf7t1CrWz6rH8BK7w0ZBTKeRhscWxgL6jt7sRBcIRwmGTK
 Bkzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWxm1OD1jIhTQaBEOjxCDLYgxlAufbAvOkFGgTB00MQrl9XZH2lKZQYLcfIsIT9ost0koKz7dIiHz+Mw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzcj+U87JJa9kXOWhl5hENna6sREuZXWgXUWGxOJNC33zhirmM4
 8dxTJKKzwJRyUhXsmv3WJhLcyIcQsZWm55UsY35/3++F2BXJ8y0t73vaU6cueg==
X-Gm-Gg: ASbGncvh68Ttp5QmXNhPLgEmMKSl36wTtH0t6z9Z1mUTLZt7x3K662xPkcTqE3Jgb8L
 WnSFB+hHy6/rgQ0qsFBu5BrZombcP1WkSVnTleZP0EWLxQWuguQ/Tg0CJQp5CdBGzCBSKQf70ef
 gbCQclo6g0CIbmCvwCg1H43pJpVmHNHje6eILsdm+3e9ptl5byz1EDMotAPs/4C+gDfxFxQcuRt
 S2ydbKrFrqmxmGQn5VRgdesKoViJ24qHMj5iIRJ/or8jZ8foOUL0miPbcyaGitdP9o1DruzeBxx
 BtY7fmWmBbrqniiqMKFCl4jle0w=
X-Google-Smtp-Source: AGHT+IFWA1PkbYOvPhddgrggwj4vKffI2QbvJQaiOGMB+TdTMcR+A/IqI39Yf7APF00zFjplkX/PAQ==
X-Received: by 2002:a05:6a00:3a01:b0:725:9cc4:2354 with SMTP id
 d2e1a72fcca58-72fd0be1847mr24747903b3a.10.1738499135407; 
 Sun, 02 Feb 2025 04:25:35 -0800 (PST)
Received: from thinkpad ([120.60.136.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72fe69ccea1sm6411268b3a.122.2025.02.02.04.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:25:34 -0800 (PST)
Date: Sun, 2 Feb 2025 17:55:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20250202122527.ggy5ccz7o4umyhif@thinkpad>
References: <20250128120745.334377-1-christian.bruel@foss.st.com>
 <20250128120745.334377-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128120745.334377-2-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 jingoohan1@gmail.com, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-pci@vger.kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 01/10] dt-bindings: PCI: Add STM32MP25
 PCIe Root Complex bindings
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

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgMDE6MDc6MzZQTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgoKWy4uLl0KCj4gKyAgICBwY2llQDQ4NDAwMDAwIHsKPiArICAgICAgICBjb21wYXRp
YmxlID0gInN0LHN0bTMybXAyNS1wY2llLXJjIjsKPiArICAgICAgICBkZXZpY2VfdHlwZSA9ICJw
Y2kiOwo+ICsgICAgICAgIHJlZyA9IDwweDQ4NDAwMDAwIDB4NDAwMDAwPiwKPiArICAgICAgICAg
ICAgICA8MHgxMDAwMDAwMCAweDEwMDAwPjsKPiArICAgICAgICByZWctbmFtZXMgPSAiZGJpIiwg
ImNvbmZpZyI7Cj4gKyAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiArICAgICAgICBp
bnRlcnJ1cHQtbWFwLW1hc2sgPSA8MCAwIDAgNz47Cj4gKyAgICAgICAgaW50ZXJydXB0LW1hcCA9
IDwwIDAgMCAxICZpbnRjIDAgMCBHSUNfU1BJIDI2NCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgPDAgMCAwIDIgJmludGMgMCAwIEdJQ19TUEkgMjY1IElS
UV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICA8MCAwIDAgMyAm
aW50YyAwIDAgR0lDX1NQSSAyNjYgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIDwwIDAgMCA0ICZpbnRjIDAgMCBHSUNfU1BJIDI2NyBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsKPiArICAgICAgICAjc2l6
ZS1jZWxscyA9IDwyPjsKPiArICAgICAgICByYW5nZXMgPSA8MHgwMTAwMDAwMCAweDAgMHgwMDAw
MDAwMCAweDEwMDEwMDAwIDB4MCAweDEwMDAwPiwKPiArICAgICAgICAgICAgICAgICA8MHgwMjAw
MDAwMCAweDAgMHgxMDAyMDAwMCAweDEwMDIwMDAwIDB4MCAweDdmZTAwMDA+LAo+ICsgICAgICAg
ICAgICAgICAgIDwweDQyMDAwMDAwIDB4MCAweDE4MDAwMDAwIDB4MTgwMDAwMDAgMHgwIDB4ODAw
MDAwMD47Cj4gKyAgICAgICAgZG1hLXJhbmdlcyA9IDwweDQyMDAwMDAwIDB4MCAweDgwMDAwMDAw
IDB4ODAwMDAwMDAgMHgwIDB4ODAwMDAwMDA+Owo+ICsgICAgICAgIGNsb2NrcyA9IDwmcmNjIENL
X0JVU19QQ0lFPjsKPiArICAgICAgICByZXNldHMgPSA8JnJjYyBQQ0lFX1I+Owo+ICsgICAgICAg
IG1zaS1wYXJlbnQgPSA8JnYybTA+Owo+ICsgICAgICAgIHdha2V1cC1zb3VyY2U7CgpEb2VzIHRo
aXMgcHJvcGVydHkgcmVhbGx5IG5lZWQgdG8gYmUgcHJlc2VudD8gSWYgdGhlIFdBS0UjIGdwaW8g
aXMgc3VwcG9ydGVkLAppc24ndCBpdCBpbXBsaWVkIHRoYXQgdGhlIFJDIGlzIGEgd2FrZXVwIHNv
dXJjZT8KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7g
rprgrr/grrXgrq7gr40KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
