Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC8B0E985
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 06:17:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DFE4C36B2E;
	Wed, 23 Jul 2025 04:17:03 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1F2DC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 04:17:01 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3e29ee0faf3so14874155ab.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 21:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753244220; x=1753849020;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8oFT6sPKOg8VRT9sf+f9nquc2yr6H2/i1A3wu9QYuo=;
 b=W5w2pSEGGZVzOTemBF4Cw6j52EJFsRBxk6qJgbRQiuAU/80oEF3g5sTTkZwR8M/W/N
 n01qOPliYKN2TjmA7bLkdbKgQi1z3l+p0gV3gx6ewDk123jtK00Xaad/xvCu5eR6vIwO
 bj74b2lsUJMAzSKFunx+EEINx6UkIzUHL6MkK70othJey1LasaZqWNfQXScq8Hy88Kb2
 eVixUxA1PUy5/n82K4WPwevSNnrw5m9XJkTHcNav6pgYYB233FJ23O9VZ2t5pzKC6qBQ
 yTtW+HwiguIc6uUMncFoZ4+xxs2AZPzu9zsiKDo04uK5qox3apRBBgdUarL33BuZVlVF
 0+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753244220; x=1753849020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C8oFT6sPKOg8VRT9sf+f9nquc2yr6H2/i1A3wu9QYuo=;
 b=WZRvwESM2tFoBSrOYqTNVpSP1Ta94J5qo96L880/8IMMwihogqLGCK1FgOK4aP0TL2
 Ge3R7ylluqHPix/1Rk2kvV7V8jyuN9CRX2sYovlMMvs6RcEWwDf1dlz26kswIcaaYBVw
 xePY16kA2dcHkbMEI2nDMTLr08LKtypFsTydrP7z8hj17TrZrF1UONoiHavONkB7Eb6l
 R+TKev4yckJkFQUh90PhxNXw1jAx+mbHLLrdunK81fU4YE0w126x0HRYH4TxrUGv0a+h
 ISfcAJ90Zgo0zYSXxvKdHfutPA5qDoRZFUEHhAcVH5EtevTy4bWw+zzX1ebBAWkYg7X0
 Xwrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ruHiSjhstzSenTG3dHYA8uiUWX14ZTAd1E5kklzM3BwK0oHJlYzFd9DjOTU1xtA14Fvmqb6XrHNbCg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywg3xJ+m8cSoA4PX9JBaCUzu7JOW5raw6itEHqbfVL6WIpTNX7S
 r2bDI/1vUzgN1o2mUPKGIsWDMIi88W6UU8W9S1HN/zxVTHU4Wx3+rJSH59wb5F7ILv0sUtRapmB
 QXmrNk3Q1XtiWj9dqjmLYJ9GjFvAXXwA=
X-Gm-Gg: ASbGncv7rQcvlmTJrdoD7aTaJtO4bucHgVRfQxUSM4QAMraGx7E1GKQH0lghS8s7SmY
 tDlwiM01p1uBXxbQ7MIBhKEQIfCkODo9sJVqUWa797/Wql11Zo81jI6A+/ttitSh/x9KoJFFjoX
 TLsfOk42hr59rRPAnKawUoL8u3QnIxus2l3ENlmJ+PAc1c8dsS2YeyTxnV5ymZFqzwhHhUWm/1t
 qWVpoI=
X-Google-Smtp-Source: AGHT+IHvfG4gDNwxiFwAV4bkIuvs3peWQ+Qchh4FuAeT25UrF8Y7hoMYUkFqbB0L8ENMUaL069TQE5i6aezBop5KoF4=
X-Received: by 2002:a05:6e02:3604:b0:3e2:a749:250b with SMTP id
 e9e14a558f8ab-3e32fc9ac94mr29841885ab.14.1753244220095; Tue, 22 Jul 2025
 21:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250722135057.85386-2-kerneljasonxing@gmail.com>
 <202507231150.Gbhu52dL-lkp@intel.com>
In-Reply-To: <202507231150.Gbhu52dL-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 23 Jul 2025 12:16:23 +0800
X-Gm-Features: Ac12FXxDJjAyfkHJ_DUda-RuAy-76P36wJK7-IwcJ40FektM2wOf1EwR8GjRFSQ
Message-ID: <CAL+tcoBj6sqKzHzmLte2uvrD4JWB=QC3U8OM0NpX2oJAyw7UmQ@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, oe-kbuild-all@lists.linux.dev,
 magnus.karlsson@intel.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 bjorn@kernel.org, mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH net v2 1/2] stmmac: xsk:
 fix underflow of budget in zerocopy mode
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

T24gV2VkLCBKdWwgMjMsIDIwMjUgYXQgMTI6MTDigK9QTSBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYXNvbiwKPgo+IGtlcm5lbCB0ZXN0IHJvYm90IG5v
dGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcnM6Cj4KPiBbYXV0byBidWlsZCB0ZXN0IEVS
Uk9SIG9uIG5ldC9tYWluXQo+Cj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFi
LWxrcC9saW51eC9jb21taXRzL0phc29uLVhpbmcvc3RtbWFjLXhzay1maXgtdW5kZXJmbG93LW9m
LWJ1ZGdldC1pbi16ZXJvY29weS1tb2RlLzIwMjUwNzIyLTIxNTM0OAo+IGJhc2U6ICAgbmV0L21h
aW4KPiBwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNzIyMTM1
MDU3Ljg1Mzg2LTIta2VybmVsamFzb254aW5nJTQwZ21haWwuY29tCj4gcGF0Y2ggc3ViamVjdDog
W0ludGVsLXdpcmVkLWxhbl0gW1BBVENIIG5ldCB2MiAxLzJdIHN0bW1hYzogeHNrOiBmaXggdW5k
ZXJmbG93IG9mIGJ1ZGdldCBpbiB6ZXJvY29weSBtb2RlCj4gY29uZmlnOiBhbHBoYS1hbGx5ZXNj
b25maWcgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI1MDcyMy8y
MDI1MDcyMzExNTAuR2JodTUyZEwtbGtwQGludGVsLmNvbS9jb25maWcpCj4gY29tcGlsZXI6IGFs
cGhhLWxpbnV4LWdjYyAoR0NDKSAxNS4xLjAKPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVp
bGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUwNzIzLzIw
MjUwNzIzMTE1MC5HYmh1NTJkTC1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkKPgo+IElmIHlvdSBm
aXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEg
bmV3IHZlcnNpb24gb2YKPiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxv
d2luZyB0YWdzCj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+Cj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAy
NTA3MjMxMTUwLkdiaHU1MmRMLWxrcEBpbnRlbC5jb20vCgpPb3BzLCBJIHBvc3RlZCBhIHdyb25n
IHZlcnNpb24gd2hpY2ggbWlzc2VkIG9uZSAneycgYWZ0ZXIgdGhlICdmb3InIHN0YXRlbWVudC4K
CldpbGwgcG9zdCBhIGNvcnJlY3QgdmVyc2lvbi4KClRoYW5rcywKSmFzb24KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
