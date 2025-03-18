Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3232FA67854
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 16:51:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEE6EC7802F;
	Tue, 18 Mar 2025 15:51:00 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC385C78025
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 08:52:36 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3014cb646ecso3428815a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742287955; x=1742892755;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
 b=bQHKmOmbRpV8UD72sJQlHRYIhIDstOT2UEHVS0x+C+OiV7Vcmm9ruqM1f97hPVl8kQ
 UIFehO+w0fvuA8Wa4fcSg18MT/dqFkQXYfFv/PdhOifMWnfR/wTyic5shD2v2ZH9KNhe
 Tzb8mLVeKocCte3URvw5t/2F13XltAHBzMyGMhM012dfeJSX5SKu1Ph5DBYHOIN7ujhr
 nJ/AQnPspJSD0+M2dup0HM9yv7SySyHBx5lTv2ZNreTz5oIq48vZ1hPe/T0AfggGDjgB
 QqhXQontAQgOQ6TmU4ZJs2rYdoP2Z6zadDVyEH09ZbOvui4XF45Ve6GLo0RszJ1M2ptk
 uSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742287955; x=1742892755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
 b=mkJ7axh15eUQg9WA9jsDKmeplMVxRtxZKNUdD1mYBoPiCY/MfAOB4dYki5KxIfE9vm
 nuOwEr6/PgXBYTQxEJvJUbwdQIZpF4dyUY6H9qus6YZWUUmZ9rb3KEI8w6OJ8okix64K
 3yfEhpnRvpt3Ap159CDjm1UABuZNSCS+eWITTsPap0ssFXhj5jb6iWExAK2iBlN1Stu6
 fRLib533x49ZIAEfELZP2McLvD6pk/K6jnp6IRccUBv1maKcMmqV0Sp0Y00/AQEI4Jzv
 x1fU7t7D5IPvG6URvKse4JfnPZXoWQXGiqrkBWjFjo+Ti6gwvAixxGPT+wuGtDJC+ssH
 82GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaaswXTKYKRkxAWuhxauyt1pwmlBrXFoVDK8jzZH2WiYsW+Grag7KAYAo7K4zxaI6QXczGpZpM2nyXig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YydBLKA40u5i9YYd2QfzZcOz+NN0j704u8nr57udjL72Lhi5oAl
 MeeHQ5glUgiJjmuKV3lh0LTGVIi8E8YveXc4cglyhSMsME0dkpYC3UOD32ASX6QYU7eOb0yKsaV
 K+F36lAulZ0atkbfoSMrR/jqimCk=
X-Gm-Gg: ASbGnctqnBhH99EIlozkaqHM07Zv1NsBvpHtcy6MjwPr9n0nzCMEm7PiqOOAXJcb30F
 v2HsdXkuWT94InxNPiR5qu5AQJyigvVuV2XapxHsJqSNYL3txvMxxNO2G4XNJvX3N61SmxrV6/K
 2dm1aMJATxiUpwXtuZbrJ3buphXfUgzJhyEg==
X-Google-Smtp-Source: AGHT+IHxBtGTYr3jKDOjfudNcmvMSpsoyb/R4JeFGP2QOzJVyaFM9HhxQUDogb4lJVnRc6RbdFlWwMuZrsbX9LPrL68=
X-Received: by 2002:a17:90b:1e49:b0:2ee:e518:c1d8 with SMTP id
 98e67ed59e1d1-301a5bc1823mr1936322a91.30.1742287955176; Tue, 18 Mar 2025
 01:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-2-robh@kernel.org>
In-Reply-To: <20250317232426.952188-2-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 10:54:07 +0200
X-Gm-Features: AQ5f1JqTpuM0NFbEd9b70zQbznVEgiaQyEKWqlPuOjeLEzVp-2Bgl4hMPBt9TEI
Message-ID: <CAEnQRZAwd-e=j2bfHimx9xjQU-2=Anr7fJ_w98t3TAweZY4J8w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 1/3] of: reserved_mem: Add functions to
	parse "memory-region"
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

T24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgMToyNOKAr0FNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRHJpdmVycyB3aXRoICJtZW1vcnktcmVnaW9uIiBwcm9w
ZXJ0aWVzIGN1cnJlbnRseSBoYXZlIHRvIGRvIHRoZWlyIG93bgo+IHBhcnNpbmcgb2YgIm1lbW9y
eS1yZWdpb24iIHByb3BlcnRpZXMuIFRoZSByZXN1bHQgaXMgYWxsIHRoZSBkcml2ZXJzCj4gaGF2
ZSBzaW1pbGFyIHBhdHRlcm5zIG9mIGEgY2FsbCB0byBwYXJzZSAibWVtb3J5LXJlZ2lvbiIgYW5k
IHRoZW4gZ2V0Cj4gdGhlIHJlZ2lvbidzIGFkZHJlc3MgYW5kIHNpemUuIEFzIHRoaXMgaXMgYSBz
dGFuZGFyZCBwcm9wZXJ0eSwgaXQgc2hvdWxkCj4gaGF2ZSBjb21tb24gZnVuY3Rpb25zIGZvciBk
cml2ZXJzIHRvIHVzZS4gQWRkIG5ldyBmdW5jdGlvbnMgdG8gY291bnQgdGhlCj4gbnVtYmVyIG9m
IHJlZ2lvbnMgYW5kIHJldHJpZXZlIHRoZSByZWdpb24ncyBhZGRyZXNzIGFzIGEgcmVzb3VyY2Uu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgoK
UmV2aWV3ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAbnhwLmNvbT4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
