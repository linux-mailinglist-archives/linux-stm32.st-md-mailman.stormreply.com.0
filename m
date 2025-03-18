Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C047A67853
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 16:51:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD424C78F60;
	Tue, 18 Mar 2025 15:51:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F0FCC78025
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 08:55:40 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2ff187f027fso5471297a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 01:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742288139; x=1742892939;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
 b=L0sVVa8znobSgvIUIvhXRb/M4CzQ0RVO2h3kgjN0CQYYY9pDrRHbs8js1P1Ca7/ZDs
 A1qAHesBnASOrj8BYQTEowSU9i43utNaDhp0m8Sx7dMBC4SKKQfEA1FPQ5VIUNPKv3xE
 gIAuiVJZoBKmrGCAu0HOeNHUtyXy+ZVB9YK7PH3kIEUiL4rdZXQZWFeqPRDSa9QsVbfu
 5PUz7rRSaMSKq4Ku0ySkqeRFFYYtWF+n9DgNxl8p7AB7TNZgNsdVwMw6VP9V14VRz/az
 Jpof1J171nnHRFFUm6is/xoXqM2I8EqMu8s7vh9BN6zrkzbBRwbWpzKpIm0uwrilvVwE
 kRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742288139; x=1742892939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
 b=gJaCVjHgaZlHmFHDlsBLov/4aDnisgxpw+45jg4f2h7L+rFZaxSQAtK/rEDQ6iizuy
 GZ82zAIwvbxgK4PG/VmcRJkgo8xVSpoR6ENqtDXogGPZa2q064Z/eOS/R1rSIhR8NsVR
 UtdRkQKVzvhItLXzsRuEPSAXnVL5BobQgI/xYrbfhyQdOhtPVikYbWoTxy5RcWb4Pec1
 iBOErUpfy0YtHUZ+VX/4ZA3Czsi0SxMN1aeIFMYbhDwyAVlL1+leNiR1dxLrdxUbIYD9
 T32Br4OjLxrUhpzpheZO1CYtS/BrbMZ4xcxH/TXifUgeqFM39x4M4vAR/JEWVNmBlWLy
 3mEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8bXDWnB7EJv2rm/5j9fJInKxpg2dblhMSYwPEUFr8548SgDRxV0mZggyCuS9/UeNIVg32+mXKByWycQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgjB/977gu684PbVjjqIk5fqPHCnMRkAxnNsdscOiECpORmW6j
 n8xPMgJmIKiW6zU1545v3T+NfIY3nq7JH/o0o8pPmpOjVYv9/kqw2aBXOCG65FG6OFN+uexkk87
 ra6XoLuFW2FkVU7ZjGTVX/EZhWZ4=
X-Gm-Gg: ASbGncu08+yA98EyswFGwCaKP+xEA+JF9a7SSvS3zIjs9UVjwYC9SQWJqWBTLvAn4g/
 qs/9dVBOKkfv1QEoA9QWM9c5lgQD4s2Kwk2I76MM24aLxneNUEFUYx3lKcJzTfgJOSEGjWX995O
 daxc+RefHVNbHbfIfxSlbI5TY=
X-Google-Smtp-Source: AGHT+IGzUXTMu6+0f6gQ8j7WPO24H14DLLXfhIDYppHhvCBnMdLnrdfvlyQcetDDzARbEXc2mLoN0e/rL5Gkqv0Y5W8=
X-Received: by 2002:a17:90b:2250:b0:2fa:603e:905c with SMTP id
 98e67ed59e1d1-301a5b0441dmr2305847a91.2.1742288138990; Tue, 18 Mar 2025
 01:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
In-Reply-To: <20250317232426.952188-4-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 10:57:11 +0200
X-Gm-Features: AQ5f1JoW0JUop4WUBf11_vConfYpr4BhM02aAcWePKMPfEFMJ9UWB8ZNiBwcNWg
Message-ID: <CAEnQRZA7jEA0V4T1JSam-vV-GcBAbynP0PCfQsyejScwdgd3pg@mail.gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
X-Mailman-Approved-At: Tue, 18 Mar 2025 15:51:00 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Saravana Kannan <saravanak@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use
 of_reserved_mem_region_* functions for "memory-region"
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

T24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgMToyNeKAr0FNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVXNlIHRoZSBuZXdseSBhZGRlZCBvZl9yZXNlcnZlZF9t
ZW1fcmVnaW9uX3RvX3Jlc291cmNlKCkgYW5kCj4gb2ZfcmVzZXJ2ZWRfbWVtX3JlZ2lvbl9jb3Vu
dCgpIGZ1bmN0aW9ucyB0byBoYW5kbGUgIm1lbW9yeS1yZWdpb24iCj4gcHJvcGVydGllcy4KPgo+
IFRoZSBlcnJvciBoYW5kbGluZyBpcyBhIGJpdCBkaWZmZXJlbnQgaW4gc29tZSBjYXNlcy4gT2Z0
ZW4KPiAibWVtb3J5LXJlZ2lvbiIgaXMgb3B0aW9uYWwsIHNvIGZhaWxlZCBsb29rdXAgaXMgbm90
IGFuIGVycm9yLiBCdXQgdGhlbgo+IGFuIGVycm9yIGluIG9mX3Jlc2VydmVkX21lbV9sb29rdXAo
KSBpcyB0cmVhdGVkIGFzIGFuIGVycm9yLiBIb3dldmVyLAo+IHRoYXQgZGlzdGluY3Rpb24gaXMg
bm90IHJlYWxseSBpbXBvcnRhbnQuIEVpdGhlciB0aGUgcmVnaW9uIGlzIGF2YWlsYWJsZQo+IGFu
ZCB1c2FibGUgb3IgaXQgaXMgbm90LiBTbyBub3csIGl0IGlzIGp1c3QKPiBvZl9yZXNlcnZlZF9t
ZW1fcmVnaW9uX3RvX3Jlc291cmNlKCkgd2hpY2ggaXMgY2hlY2tlZCBmb3IgYW4gZXJyb3IuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgoKRm9y
IElNWCBwYXJ0OgoKUmV2aWV3ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAbnhw
LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
