Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F35B99359
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 11:44:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A945C36B19;
	Wed, 24 Sep 2025 09:44:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 175DBC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 09:44:47 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45ed646b656so57201995e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758707087; x=1759311887;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aU7V00+zuQKk7Voi/XulM/d8ejeausZ1gHzc4r7h4R8=;
 b=QaDel0nkQjwYWXTy6BW5qdFnzT82fyjUPPOmGysc5dRbKtpkmPjDIwfVS3xGveclxh
 5ZqWM4WgM9JibAupzy46VPBUTxY3udW71SHOBOOlue/3nYNJxn5DdtVGCjqog0Dq6mds
 QnWJSWAMMAmXZdP2wC/21D2P0F+Ku+/5WaDsEs4/EIFSPGptSS77ykau8TISVPMutmi7
 64vsdWw6x6jtVRIg8jg0HN8NB3ejGaapj3uEPsrr2SVd9izGCunAb7f6p+s8mAmPdXGJ
 omCcTryL4xt7xz+VtpDQ8Z6mRsO8g/FRYRbyiSsDhBBuOEuD6xftmmHzJHucoXrTi7G/
 rLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758707087; x=1759311887;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aU7V00+zuQKk7Voi/XulM/d8ejeausZ1gHzc4r7h4R8=;
 b=ZgRoPofvlHHAiWkhPGBN4e4czVxVYElG3AK69Pep2R7TmpBBpV78uVGsAPGA2JE+Df
 Mw7CqMaUUovksC9KYrYhCA2TJC4Ys+Q8x11Kl6XOOZctormqI0452uoqse2YjtCZuPYI
 KpvuZDIjfSoA3CklC096Dda11wFflA9CId6V3YCtY6IcC9+qIgYtwUVq625KIvLNOlza
 pTssE3L8/4qLtzW4euTLPyJnnl5dTQIJ62GgPfAhUphE5rkxYxWU1S9PFC4gClZnQsXm
 UQau7qWgljBUDVSkwBpo0yCJkyh9wuKBbANdMD+NQMvAPvD1qK6dvWFxef5sRJmH0cvV
 19+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhqEXq8NaDoU9x5jr5F3X8VUXJlXHjiXBfmbx/Vonce5pRdrrLlnXmBe5dsVY+I5t16Goob7vaVY3k5w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQ3YUjLfCAC8GuXNe1zN3N4cpzrbP5jHQ66QH+2KZScV4sfrBs
 uJyvjNuU/coHbrMAPDeZsozmwZK5o0naS97wdV2sOA0EJAagFIJS49kS
X-Gm-Gg: ASbGncujgIhkoEJ+BNaPL+uko+DFgPEjAYG5fnErnnxpC9fD+Q4fPpLh5Yvy83/80Ak
 AP8s1zwm9n7qPJKan+mDt/+I+RYa0HYtBdgJTW8ruRMS3l+/1sl3LP9Q2ZH2hOeAWH60bIVu05E
 kyYnXAxSWNBjj3Jvq3Qi5xgcRdyCXG536JHqtMtZfKTvVzprd7Bb9OndyoGe2aDbTM9vH7wmNlA
 HoJZWLSVWBkOoWuqsDLUJoaaKRZtd0PqkOvq6AHsRmgBthONIartFkNLblIAcRSLjFR44F+aRxI
 QJsmZfhIY7SBZYE8NRi0GhDEEUxmxsYWmFxZ+05RmRwMf+5RHHIk4mvaA3iJ4fqD1K0dBVc3G4O
 kvL4SpdUNzuPPYXuLcO7kCqhL2DOBItFzqEBVMwNuD2QYyDmQszi+3WOzxGYFWcredp8AWMnrUt
 T2wrNBc8f4yi0UjA==
X-Google-Smtp-Source: AGHT+IFpHasan3pFJOdP5ZGB5ynPDa66E5OeJLF7PLwNIJrHXHfWU8ia57w+wOsWZehdESEd0RRK+Q==
X-Received: by 2002:a05:6000:208a:b0:3ea:6680:8fcd with SMTP id
 ffacd0b85a97d-405c49a250fmr4780811f8f.13.1758707087081; 
 Wed, 24 Sep 2025 02:44:47 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net.
 [2a02:8440:7503:805b:76:f865:8f03:23d3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac55esm28446145e9.6.2025.09.24.02.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 02:44:46 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:41 +0200
Message-Id: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIm902gC/2WP0Y6CMBBFf4XM83bTFiiFJ//D+DC0M9oERFtk1
 xj+3SoPa7KP9yZz5twHJIqBEnTFAyItIYXpnIP9KsCd8HwkEXzOoKWuZauM6CsRnRO3S5oj4Sg
 sWsIS2aD0kK8ukTj8von7w5YjXW8ZPG8l9JhIuGkcw9wVsiHdoFembFtk501b9pSfKdVLz0imJ
 GlUzfAp1BWfOhwi/eAw/Dl5Jltbi1qx7ZYGXh6nkOYp3t9Dc/US2SBa/9u0NEIK7dlVJJXlSu6
 OI4bhO0vDYV3XJzN1wsI2AQAA
X-Change-ID: 20250916-b4-rcc-upstream-8a8ea3af6a0d
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 0/3] Register the STM32MP25 RCC driver as
 an access controller.
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

VGhlIFNUTTMyTVAyNSBSQ0MgcGVyaXBoZXJhbCBhcyBhbiBhY2Nlc3MgY29udHJvbGxlciBpcyBh
bGxvd2VkIHRvIGtub3cKd2hldGhlciB0aGUgY2xvY2tzIGFyZSBzZWN1cmVkIG9yIG5vdC4KVGhl
IFNUTTMyTVAyNSBSQ0MgcGVyaXBoZXJhbCBrbm93cyBhYm91dCB0aGUgY2xvY2sgc2VjdXJlIGNv
bmZpZ3VyYXRpb24Kb2YgYWxsIG5vbiBSSUYtYXdhcmUgcGVyaXBoZXJhbC4KSW4gcGFyYWxsZWwg
YWxsIHRoZSBSSUYtYXdhcmUgcGVyaXBoZXJhbCBjb25maWd1cmF0aW9uIGluZm9ybWF0aW9uCmFy
ZSBrbm93biBieSB0aGUgUklGU0MgcGVyaXBoZXJhbCB3aGljaCBpcyBhbHJlYWR5IGFuIGFjY2Vz
cwpjb250cm9sbGVyLgoKQ2hhbmdlcyBpbiB2ODoKLSBVc2UgdXBwZXJjYXNlIGZvciBwZXJpcGhl
cmFsIG5hbWUgaW4gY29tbWl0IG1lc3NhZ2UKLSBBZGQgdGhlICcjYWNjZXNzLWNvbnRyb2xsZXIt
Y2VsbHMnIHByb3BlcnR5IHRvIHRoZSBSQ0MgaW4KICBzdG0zMm1wMjMxLmR0c2kKLSBMaW5rIHRv
IHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwOTIyLWI0LXJjYy11cHN0cmVhbS12
Ny0wLTJkZmM0ZTAxOGY0MEBnbWFpbC5jb20KClRoZSB2NyBpcyBhIHN1YnNldCBvZiB0aGUgdjYg
YW5kIG90aGVyIHByaW9yIHZlcnNpb25zLCBzcGxpdCB0byBzaW1wbGlmeQp0aGUgcmV2aWV3IGFu
ZCBtZXJnaW5nIHByb2Nlc3MuCgpDaGFuZ2VzIGluIHY3OgotIE5vbmUKLSBMaW5rIHRvIHY2OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MDktYjQtZGRycGVyZm0tdXBzdHJlYW0t
djYtMi1jZTA4MmNjODAxYjVAZ21haWwuY29tLwoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUg
R29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KLS0tCkNsw6ltZW50IExlIEdvZmZp
YyAoMyk6CiAgICAgIGR0LWJpbmRpbmdzOiBzdG0zMjogc3RtMzJtcDI1OiBhZGQgYCNhY2Nlc3Mt
Y29udHJvbGxlci1jZWxsc2AgcHJvcGVydHkKICAgICAgY2xrOiBzdG0zMm1wMjU6IGFkZCBmaXJl
d2FsbCBncmFudF9hY2Nlc3Mgb3BzCiAgICAgIGFybTY0OiBkdHM6IHN0OiBzZXQgUkNDIGFzIGFu
IGFjY2Vzcy1jb250cm9sbGVyCgogLi4uL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2Mu
eWFtbCAgICAgICAgICAgfCAgNyArKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
MzEuZHRzaSAgICAgICAgICAgICB8ICAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJt
cDI1MS5kdHNpICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMy
bXAyNS5jICAgICAgICAgICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKystCiA0IGZp
bGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLS0tCmJhc2UtY29t
bWl0OiAwN2UyN2FkMTYzOTlhZmNkNjkzYmUyMDIxMWIwZGZhZTYzZTA2MTVmCmNoYW5nZS1pZDog
MjAyNTA5MTYtYjQtcmNjLXVwc3RyZWFtLThhOGVhM2FmNmEwZApwcmVyZXF1aXNpdGUtY2hhbmdl
LWlkOiAyMDI1MDkxNi1iNC1maXJld2FsbC11cHN0cmVhbS1kZmU4NTg4YTIxZjg6djcKcHJlcmVx
dWlzaXRlLXBhdGNoLWlkOiAxZWFkOTYwZjQwNWM3YTJkY2M5MTExYWNkMGJiNGM5NWVkMzM5NTRm
CgpCZXN0IHJlZ2FyZHMsCi0tICAKQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50
QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
