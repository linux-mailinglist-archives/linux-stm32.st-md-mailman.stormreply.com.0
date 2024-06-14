Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA89085BB
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 10:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F22ACC78017;
	Fri, 14 Jun 2024 08:10:46 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 368F1C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 08:10:40 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57c68682d1aso1875856a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718352639; x=1718957439;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dQuauHWW6Nhu7VIVhyecgZ9pWHe1Gm4RQ6VrtSN+/jk=;
 b=SQSlbu/jEQAukzsXoUsw84LvB2OmsQWpVNHEynkdngsd6qBxZzBpNADTkJjEvTVXG6
 XLuCiaSdUI+Tqt0tE9cAieTW+cGz1G18fJ8kJ/CoNCmGvtqWww09iq5ezarRBW80NiwV
 ULt+kywDPSpzOt6G/igK1vjOD3dSpwb1SdF1VtSYwcV04OxQ1Naf60f4YFhO62/IsanN
 8p/5GGCY3bvIi0/4QEUrtIXUENggMhOChVj0rkHiEQTb21M/SVpSJoBZv/K4dcX4mHl1
 +jWghfiKK7A9aqcwEOE3KE/KyYzYpc6ZrUlsYxanAp3wzVkhpmiXtii+9USMlV/gLmF5
 R2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718352639; x=1718957439;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dQuauHWW6Nhu7VIVhyecgZ9pWHe1Gm4RQ6VrtSN+/jk=;
 b=M8twc3/bFeCblbKO3l7dmw2ga6uucNbTFLPjJuyiNRLYgddI25gfwPyuGwj5Sr1nXA
 jsbe3eCf2oEAYMCwR3l6N4zC6NEkv3Uv3WP2/ML1ItJPWFPx3jHR5zp1h2yNhR7pkWoZ
 uSvCykAgXDA/VUt2O3oe7hWvNWeYATvygdKPz++moJbUqyPBRvLKfAR3t7xnm9tSnM3P
 wYyDiIAqx+s4ILaHf3qexGYfqUFZPkPLYXgJPEOo/XkMDnmZqLDaegPhFtLIG9xIrbwt
 L3YHJjHoY4NzGdCB5OKUX12BjerJQaDwggArkCX/+ThdXdygh/Bn3KMWfMkav3MLm9G7
 x/oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYInBbklop6RUtNXBrynUMZtJ9rdmwYoG4qKbHneWJMzcrao58Kmy6O4Yj8dgWB3fkrQdCozcnKNW5xuURg1g+CqDwEv2w+m1KRVYhX1I/2yXChi77i0Cb
X-Gm-Message-State: AOJu0Yz7uScDH8CukVe8zrJ4iYGMc+Y+nsft8VoM4CVXQFF8tjOjsTK/
 aqd7Aih7P7quezhGq/Y9H4uauerNOYblEox34BPjnAv9xfqzQPXrOAe/D43/rfg=
X-Google-Smtp-Source: AGHT+IG4iAQVA130APkrQA/MPvG/bMQvQuYj4vQDeEupKxmjnm9Px/TgUM87w6xgfYjGLI7F60ewqw==
X-Received: by 2002:a17:906:138c:b0:a6f:2e28:4008 with SMTP id
 a640c23a62f3a-a6f60dc572cmr131844766b.54.1718352639612; 
 Fri, 14 Jun 2024 01:10:39 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f988f9sm156627466b.197.2024.06.14.01.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 01:10:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>
Date: Fri, 14 Jun 2024 10:10:10 +0200
Message-ID: <cover.1718352022.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=XtY06yQNqFNmqjsRt6dtXpp7Ga45DKbLPLwoxJXu+Kk=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhrTsX48f8qn9z6i3nvpq/lb/5wZuPQ5SHKzvz7qb9x8N2
 OCYfYOpk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJSDBwMLTPlr2rVuUWNW+2
 8t08vd2+dll7nn3JkzF4Uy+rPeVf0M0809/RBawrGJvKSvns6tS/l9gtbbgc/kcqjSnUaFKfDqP
 Lyikbf8Q+cd4sc/8VpyO7nf6mCX3zZkmYd3JJcxUocLjd4ngeHHTF2k28TLBdnf1JqfCj7L6mZv
 eEMxyTZpsHa6crfLSOuXp/6aFG5Yu+86r+GGfnrlh3145Jt/6gPXeju/zea76OlX3TZz1PNdj8N
 v9Eef4cFrkH27ffUTmXuH1vs3MN48tVeY8P7u15pW5/Lo7Hu8jgzJ6D1p7zP24JmNPb2KXcVDwp
 k/nZZ9N1mxmeeWj4sNi1H3nva3+p5aDdXJemjzuuF3MCAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/4] mfd: stm32-timers: Make register
	definition more flexible
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

SGVsbG8sCgpJJ20gbm90IHN1cmUgdGhhdCBldmVyeW9uZSB3aWxsIGFncmVlIHRoZSBjaGFuZ2Vz
IGluIGhlcmUgYXJlCndvcnRod2hpbGUsIGJ1dCBJIGxpa2UgdGhlbS4gT25lIHN1cnByaXNlIGlz
IHRoYXQgdGhpcyBtYWtlcyB0aGUKZ2VuZXJhdGVkIGNvZGUgZm9yIGRyaXZlcnMvcHdtL3B3bS1z
dG0zMi5jIG1vcmUgY29tcGFjdCAoc2VlIHBhdGNoIDQgZm9yCmEgYmxvYXQtby1tZXRlciBzdGF0
aXN0aWMpLiBJJ20gc3VycHJpc2VkIGJlY2F1c2UgaXQgYm9pbHMgZG93biB0byBnY2MKbm90IG5v
dGljaW5nIHRoYXQKCgltYXNrID0gKCgoKDFVTCkpKSA8PCAoMSArIDQgKiAoKDEpIC0gMSkpKSA8
PCAoY2ggKiA0KTsKCmlzIGVxdWl2YWxlbnQgdG8KCgltYXNrID0gKCgoKDFVTCkpKSA8PCAoMSAr
IDQgKiAoKGNoICsgMSkgLSAxKSkpOwoKLgoKSSdtIHVuc3VyZSB3aGF0IHRvIHN1Z2dlc3QgZm9y
IGhvdyB0byBtZXJnZSB0aGlzIHNlcmllcy4gSSBoYXZlIHNvbWUKZnVydGhlciBjaGFuZ2VzIG9u
IG15IGFnZW5kYSB0byBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYywgc28gZWl0aGVyCm1lcmdpbmcg
dGhpcyB2aWEgcHdtIG9yIGEgc3RhYmxlIGJyYW5jaCB3b3VsZCBiZSBncmVhdCBmb3IgbWUuCgpC
ZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5pZyAoNCk6CiAgbWZkOiBzdG0zMi10aW1l
cnM6IFVuaWZ5IGFsaWdubWVudCBvZiByZWdpc3RlciBkZWZpbml0aW9uCiAgbWZkOiBzdG0zMi10
aW1lcnM6IEFkZCBzb21lIHJlZ2lzdGVyIGRlZmluaXRpb25zIHdpdGggYSBwYXJhbWV0ZXIKICBt
ZmQ6IHN0bTMyLXRpbWVyczogRHJvcCBUSU1fRElFUl9DQ19JRSh4KSBpbiBmYXZvdXIgb2YKICAg
IFRJTV9ESUVSX0NDeElFKHgpCiAgcHdtLXN0bTMyOiBNYWtlIHVzZSBvZiBwYXJhbWV0cmlzZWQg
cmVnaXN0ZXIgZGVmaW5pdGlvbnMKCiBkcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMg
fCAgIDQgKy0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jICAgICAgICAgICB8ICAyMiArKy0tCiBp
bmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaCAgfCAxNzkgKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspLCA5OCBkZWxl
dGlvbnMoLSkKCmJhc2UtY29tbWl0OiAxNjEzZTYwNGRmMGNkMzU5Y2YyYTdmYmQ5YmU3YTBiY2Zh
Y2ZhYmQwCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
