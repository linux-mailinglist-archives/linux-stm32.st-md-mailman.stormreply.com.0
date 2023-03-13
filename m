Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C066B8C61
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 09:03:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23841C69053;
	Tue, 14 Mar 2023 08:03:21 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB415C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 21:38:08 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5419d4c340aso82459987b3.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678743488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
 b=oBqnejAr+cRAwqwSDggHbvyESDCGAm0IT2diFdiMbosVlO5Ebuhv06xmTVl9Mh/HiC
 neV3kaLcXxQXZ8rWMN8gaBnTm1Qs4vHbNOBsKiKclKcZXxdswwbW7rBFUKdItfCnI55B
 2ciaYsFh+G7t/+4hYcljFYbfjyaEpP3SMr2C9qEUP/kIQsFIHhlZF56rBM4WUzFRQ661
 MMseawNEKdVEkMrE+QDWzPun/jDHPZLOHsF0+5oWgZmpKX/eGOmxBPDExhV/iJDyeQ53
 7MDPKM5XS+1UdJ2cwhsUmyEm2WnUYeGW2PETZiXrAbRMWy1JxeNHHzOrvI5hsaoqnfPl
 S05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678743488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
 b=261gz8SXQQGsgTQYVcy053AxDrn6hnDDSHLuvczN6mnCGuwB+jwk8Agw09t8FkG9d5
 n2bjUG9k2lDO0i98TXhMtXvf/gehF5NFJK545gB7/z5ZJdtqZonPGAtGhwaJF+ubIFqx
 Ge737MxyiOoa6lEj3wnx8v3TyJUAzyphTudCb9hgzO+5sz/EO0ENqgDD9ITTOqxeTOb6
 1AmRkEOvwtXSw+V890KDqKmFRAHnvXk7uY5d2QsadgWIjum1hsYy1hd7iOsVIuiwtfI0
 bI/soXri8jAfYJew4VSZLVcTJbUIa4bxxY0ylVHgqReSkSLLooc/zocaAdYQLxBptogx
 IE5Q==
X-Gm-Message-State: AO0yUKXYjfkFrhtOAHSb2dTt0kynlhB34c6rs094wpy4rNAKQ948OJDn
 gOrCWKgeD6T3Qf0X5WZmBsCWVs0t9jdDz+/7hvx6jg==
X-Google-Smtp-Source: AK7set8L1lXLBOk8wvAHM9wRqKPNXWlxKrtxI+qzt+FALwwKZEBkTpnXYO0qQldUzFZLmRJDWTgYnC/ZzTNl4HJfoug=
X-Received: by 2002:a81:ae04:0:b0:534:d71f:14e6 with SMTP id
 m4-20020a81ae04000000b00534d71f14e6mr5550337ywh.9.1678743487766; Mon, 13 Mar
 2023 14:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:37:56 +0100
Message-ID: <CACRpkdZngHNjW0=ZtnjvNV=rfR8tip_iqTE-FDWY+ggsU6DCmw@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Tue, 14 Mar 2023 08:03:19 +0000
Cc: linux-aspeed@lists.ozlabs.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, mripard@kernel.org, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 00/25] drm/dma-helper: Add dedicated
	fbdev emulation
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

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgNDo1MeKAr1BNIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToKCj4gVGVzdGVkIHdpdGggZmJjb24gYW5kIElHVCBvbiB2
YzQuCgpBbHNvIHRlc3RlZCBvbiB0aGUgVTg1MDAgTUNERSBvbiBTYW1zdW5nIEdULUk4MTkwIChH
b2xkZW4pCnN1Y2Nlc3NmdWxseS4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
