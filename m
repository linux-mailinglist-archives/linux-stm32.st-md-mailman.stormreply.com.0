Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF27665C0
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 09:50:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADB45C6B466;
	Fri, 28 Jul 2023 07:50:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0FB6C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 07:50:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-317744867a6so1807064f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690530609; x=1691135409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWZjwy6pQMZHW/ycR5wFpCkUrH/I+MWTyG22Ld0AHd8=;
 b=Uy6IkQaEmOV/1fJt3P6huXOnuoGk9Cme52stmDNgJdqhsRNv9QwZfii2+tKpcrN4de
 S1PG1PR0S5LLSETCx0wEwwi0mMEHM2ONhsbt0+VMvuOsBxYbdoSRM8WW3NdWSAqmOaQc
 WopD2MIg6XGAg5ZW8l1zv3yr0S80+O6zz3USor1uP0tYxSLFmwmUJzCOC6jHt4fGD2dc
 2S82gNtQ9H3/LeuQpfBUbdKEaNq1RxlOAc07FFMXZNm/j5EAdW/VJWpSAgftJxbWl2Q3
 6Rd1X6OL46dgsVqmSLbq+0IIDCOnBZNAj4Z2qjdRS4FKaf9nlm8c2qrJ9rllvTqpmsqx
 7X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690530609; x=1691135409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWZjwy6pQMZHW/ycR5wFpCkUrH/I+MWTyG22Ld0AHd8=;
 b=cR1NJioVmRfJfinERc2VYoWZ+vKp1lmiYK+qJpZGgV7rR1cI0ZAlIoLhsUCBMZ50c5
 KxffODO2Ep1vCKQb0HDMgKykPcmMjjmKDzMkkcBFTwcnBjNaLzqTaMuPjCM8SWluwXXi
 YDdo4cWPIM5QmJrvVZSDBPhKczXDczaOfkaqZq5f7LloVwDe6acAybIwrw10+Xo78DPA
 mGSdH7hCLpMAVgxul/6egUej83BrO0pjhobVxIyIvun6J4vPTXC1xUnuefUdGr2VpjSo
 D9YJPqc2KflnwKXkhGyxmrgMIXeqAKX8d4cXIOhfovf2cM2ox7WogGoaMARoB7/3u/E0
 c3Sg==
X-Gm-Message-State: ABy/qLbdhDApD6TD6DDud/s4EbF6ZVauI0do7bK7YX8r8R2orPJqZbL2
 In+og++rOHtXdoGfAvxwJAA=
X-Google-Smtp-Source: APBJJlHe4ONFltmWxzM/BVnupMzDT/EG73Rf4UqSyTDBTwWvbIflEbZnDfPnIl//KPUlUn1Cbbg/rQ==
X-Received: by 2002:a5d:674c:0:b0:317:43de:4c0a with SMTP id
 l12-20020a5d674c000000b0031743de4c0amr1143071wrw.20.1690530609050; 
 Fri, 28 Jul 2023 00:50:09 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 m2-20020adffa02000000b003175a994555sm4181480wrr.6.2023.07.28.00.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 00:50:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 28 Jul 2023 09:50:06 +0200
Message-ID: <169053057430.3515253.9220792753851124413.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713155142.2454010-1-u.kleine-koenig@pengutronix.de>
References: <20230713155142.2454010-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] pwm: stm32: A (small) fix and a
	cleanup
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

Ck9uIFRodSwgMTMgSnVsIDIwMjMgMTc6NTE6NDAgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IEkgd2FzIHN1cnByaXNlZCB3aGVuIEkgc3BvdHRlZCB0aGUgc3RtMzIgY2FsbGluZyBw
d21fZGlzYWJsZSgpIGluIHRoZQo+IHJlbW92ZSBjYWxsYmFjay4gSSB0aG91Z2h0IEkgZml4ZWQg
YWxsIGRyaXZlcnMgaW4gdGhpcyByZWdhcmQuCj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCj4gCj4g
VXdlIEtsZWluZS1Lw7ZuaWcgKDIpOgo+ICAgcHdtOiBzdG0zMjogRG9uJ3QgbW9kaWZ5IEhXIHN0
YXRlIGluIC5yZW1vdmUoKSBjYWxsYmFjawo+ICAgcHdtOiBzdG0zMjogU2ltcGxpZnkgdXNpbmcg
ZGV2bV9wd21jaGlwX2FkZCgpCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzJdIHB3
bTogc3RtMzI6IERvbid0IG1vZGlmeSBIVyBzdGF0ZSBpbiAucmVtb3ZlKCkgY2FsbGJhY2sKICAg
ICAgY29tbWl0OiBlOWMyZjY5YWFjMDU5MTlhNGYyYmY3MmE3YjUzYzQzYWMzZjRjNDEwClsyLzJd
IHB3bTogc3RtMzI6IFNpbXBsaWZ5IHVzaW5nIGRldm1fcHdtY2hpcF9hZGQoKQogICAgICBjb21t
aXQ6IDhjODlmZDg2NmFkMjIxYWYwMzdlZjBlYzNkNjBiODNkMGI4NTljNjUKCkJlc3QgcmVnYXJk
cywKLS0gClRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
