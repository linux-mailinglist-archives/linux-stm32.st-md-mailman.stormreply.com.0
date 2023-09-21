Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C15F67A93FC
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 13:51:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8501EC6C823;
	Thu, 21 Sep 2023 11:51:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BFB1C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 11:51:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7896261ED1;
 Thu, 21 Sep 2023 11:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558CBC4AF7E;
 Thu, 21 Sep 2023 11:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695297096;
 bh=pNpu7kAjTQG7cwg+rw2cpVUro1wPNljZtedLZJWJg00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rg6s3O4ob+dBxj+11wlsPemZwDZOC9UcNhtZNwkYJMSzN37C0M3fSHXBdHaOPrqLZ
 jwWPZTieql3Zdl2it5z7aIl8RV1S8NPgg7kZpCWb7aKyDRnlVdQ0ao/FGnXBPwjati
 lyIEpb4tkOg8oJl01GhR9CB7VS+/uUiRS5GRDRbyEyQSz/CH3EL0gBeFNUzRc2u8W8
 yYD5XYZULCCGgHy5MBAZRTDH8Lxe81RLH1AGHZ8mcG0+cdYseQpLvHJ7uxq5vCYQoU
 BQ+8ur0SWKTOMvpaiAtO4FE5HvY7EW6ZVx8845h+GxHHuay3an0kWaOdVWCfQ3r9f2
 /zsy6eAUx5GQQ==
Date: Thu, 21 Sep 2023 12:51:32 +0100
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20230921115132.GH3449785@google.com>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
 <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, william.gray@linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 8/8] counter: stm32-timer-cnt: add support
	for events
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

T24gVHVlLCAyOSBBdWcgMjAyMywgRmFicmljZSBHYXNuaWVyIHdyb3RlOgoKPiBBZGQgc3VwcG9y
dCBmb3IgY2FwdHVyZSBhbmQgb3ZlcmZsb3cgZXZlbnRzLiBBbHNvIGFkZCB0aGUgcmVsYXRlZAo+
IHZhbGlkYXRpb24gYW5kIGNvbmZpZ3VyYXRpb24uIENhcHR1cmVkIGNvdW50ZXIgdmFsdWUgY2Fu
IGJlIHJldHJpZXZlZAo+IHRocm91Z2ggQ0NSeCByZWdpc3Rlci4gUmVnaXN0ZXIgYW5kIGVuYWJs
ZSBpbnRlcnJ1cHRzIHRvIHB1c2ggZXZlbnRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
R2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2Nv
dW50ZXIvc3RtMzItdGltZXItY250LmMgfCAyNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystCgo+ICBpbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaCAgfCAgMTUgKysKCkFja2Vk
LWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPgoKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyODUg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
