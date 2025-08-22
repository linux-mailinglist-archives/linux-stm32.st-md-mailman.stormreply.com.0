Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 419E6B31303
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 11:28:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA2FBC3F959;
	Fri, 22 Aug 2025 09:28:48 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E63D2C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 09:28:47 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-74382041c9eso1109505a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755854927; x=1756459727;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqlMfpxirxZlbM+EOIPx1jKbcg0mazAKdivQSHylYck=;
 b=kmWpw9izmg0FCdcvsLFICfDc/acp6yNKr7QslwZXL6DWkbe/d22ye5UHlVrafsyhb3
 Tm1Zfo2B9p+n24AF/tqi1t/qBcS4ST+5opoZacawPKK0B8FHdm1jqOgdgQl7pUB+Tgcu
 /f71eYztsg8v5rJXNp5y1eM+qiK1Yk9NzR+uwXLM+/9A4GCPlWdGQZVUK1CKmlp6sPcK
 tS2d3ORzLV5ne9xuib/7BwlOs7P+9r++Tvx36gDHPZ1gIbN5pwcTYesCiRRBZ7p1MTqr
 octTZk+JOO8juls71yS3U18FaQl6xDNPfx3NTdHu7wmyFiK/0mru8aVoLmQ2S/4lbiCv
 HBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854927; x=1756459727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqlMfpxirxZlbM+EOIPx1jKbcg0mazAKdivQSHylYck=;
 b=MLMF0BEtRW5GNwQvgQjYnYbitxpmi9qZDRdckWiyOr1Bg5gclLGrFmqGZ1IiIHaeZw
 KM6VyB4zvrfYbJN4+OkCqCLB7FMvzszdXDBs6LyYtW2m/+7LEVy3i0UN09AVspZ4sOm3
 KGTiaaefZjOD2HZUaJDpVxkvMFRcRVMqVac7Cf4yGH3VaShcpe4wlx/aV6SoPbEy+2Bv
 wZ1JuT2ufUaE7PlUcGKA+fqEORxt9dHg3H3Mdx/CVuoeG2kH2twFVXsEpfvqF8n8Uiev
 eql3L6IYnWGnRYbr8ANewQdU+u6QNyHdE3Rdd1XfFJ5OuQF0df06XkCjXxTNoO+fHAOY
 iXhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnaJ/V5PBGjzMjUs6tkY/K3yIDpf8VmbNO/Hdr59yFk/9W1oA4iiwKwNT5uFAdaFZLqokHtMxxxlNHwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3ySRi3I5nIjA4Be7EgUz6R8GRW0HLI0EgqKEY5Wb8rO4juHdh
 tm64HKCccVERGyThGwcc1M9gvGM+R2fyAxylDJj/bQuGr7GYtNvIc4sO26/2CSxqP04XKRUKhm7
 5NxcEmVcr0pcIdbRLOw62NoWDox6rA8Q=
X-Gm-Gg: ASbGncuiZq5ASsxBaFCIUf/AdyX1voO/mym6ICDI8V+hyZsG1y+h06n8qk3qVKesu/d
 5xSOyChLFzPRqd7rW6iwpvgWyXmheY55IRjfxdWzYPMbEey8gS3WDVyfDLBRKaxEfJxsDWA5DkE
 rfXXMOGTXGS4Z346Dq+NCdB6svT2R6ExkH4qNUJ5fy0rSl9msAohLKCCPLIsjewENHBD8dlgH/q
 yz6A2ZA5yHu
X-Google-Smtp-Source: AGHT+IG0WUhPdSZY22zjNFYLvLkRtJyOHuecSxMaftHRAg40biaWvqUVTZ0TEJKgzzIWavFPuLuDyvykjJqKjLkk/oI=
X-Received: by 2002:a05:6830:6007:b0:742:fd4c:53b5 with SMTP id
 46e09a7af769-745008e592emr1631143a34.4.1755854926647; Fri, 22 Aug 2025
 02:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
In-Reply-To: <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 14:58:34 +0530
X-Gm-Features: Ac12FXxMSIjWb7zWOXJ_ncO-BRx2eimh_ZSSxq_sHgWo2d3eJFCXvRVqNXXDoHg
Message-ID: <CAFmh=S3x+SsuW79MdN6gE66CSK7smvbBy=22j=c9jGVOns6PiA@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/10] iio: Drop unnecessary -ENOMEM
	messages
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

T24gRnJpLCBBdWcgMjIsIDIwMjUgYXQgMTE6NDnigK9BTSBBbmR5IFNoZXZjaGVua28KPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSSBkb24ndCB1bmRlcnN0YW5kLiBEb24n
dCB5b3UgaGF2ZSBhIHN1YnNjcmlwdGlvbiB0byBsaW51eC1paW9AIE1MPwo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LWlpby9DQUhwNzVWZEw5a1YyZnlpNjN6cVBablc0Q2FlWVBtSjc0
dG1HRWdVPU03RlNZQnYwd3dAbWFpbC5nbWFpbC5jb20vVC8jdAo+IElmIHlvdSBmb3VuZCBzb21l
dGhpbmcgbmV3LCBwbGVhc2UgYmFzZSBpdCBvbiB0aGF0IHNlcmllcyBhcyBpdCB3YXMKPiBhbHJl
YWR5IHNlbnQgYW5kIHJldmlld2VkLgpUaGFua3MuIEkgZG8gaGF2ZSBzdWJzY3JpcHRpb24gdG8g
bGludXgtaWlvQE1MIGFuZCBkaWQgY2hlY2sgdGhlIHBhdGNoCnNlcmllcyB5b3UgbWVudGlvbmVk
LgpUaGF0IHBhdGNoIHNlcmllcyBieSBYaWNoYW8gWmhhbyByZW1vdmVzIGRldl9lcnJfcHJvYmUo
KSBmb3IgLUVOT01FTQpjYXNlcyB3aGVyZWFzCnRoaXMgc2VyaWVzIGlzIHRhcmdldGluZyBzbGln
aHRseSBkaWZmZXJlbnQgY2xlYW51cCBvZiByZW1vdmluZyB0aGUKcGxhaW4gZGV2X2VycigpIGxv
ZyBtZXNzYWdlcwp0aGF0IGFyZSB0aGVyZSBmb3IgLUVOT01FTS4KQXMgZmFyIGFzIEkgY2FuIHNl
ZSwgYm90aCB0aGUgc2VyaWVzIGFyZSBtb2RpZnlpbmcgY29tcGxldGVseQpkaWZmZXJlbnQgZHJp
dmVyIGZpbGVzIHdpdGhvdXQgb3ZlcmxhcHBpbmcgY2hhbmdlcy4KU2luY2UgdGhlIG9iamVjdGl2
ZXMgYXJlIHJlbGF0ZWQgYnV0IGluZGVwZW5kZW50IGFuZCBhZGRyZXNzaW5nCmRpZmZlcmVudCB0
eXBlIG9mIGNoYW5nZSwgSSB0aG91Z2h0IHRvIGtlZXAKdGhlc2UgcGF0Y2hlcyBpbiBkaWZmZXJl
bnQgcGF0Y2ggc2VyaWVzIGFuZCBoYXZlIGNsZWFyIGRpZmZlcmVudGlhdGlvbi4KQWx0aG91Z2gg
dG8gZXN0YWJsaXNoIHNpbWlsYXJpdHkgaXQgd291bGQgaGF2ZSBtYWRlIG1vcmUgc2Vuc2UgSWYg
SQp3b3VsZCBoYXZlIGFkZGVkIHRoZSBsaW5rIHRvIHRoYXQgcGF0Y2ggc2VyaWVzIGhlcmUuClRo
YW5rcywKRGl4aXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
