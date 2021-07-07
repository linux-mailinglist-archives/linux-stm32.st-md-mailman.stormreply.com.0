Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C79283BE51F
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jul 2021 11:07:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D403C57B5B;
	Wed,  7 Jul 2021 09:07:40 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B972C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jul 2021 09:03:06 +0000 (UTC)
Date: Wed, 07 Jul 2021 09:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1625648585;
 bh=FfzoFy/JPOfylMDSWf+V05WzCz+VvbqhnbLqlhgFSx8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ljxtuZM65q38o0IdXEGPYwe0aG0xa7D7WyJPn6tKjLJFJcC7flV2mmW5khXcCFex1
 vJSgPp2kAjkSWyHproJkq38PP4V41BvS2OJOomjwzB4nOW7/MLiATIOeTE2TMftSaE
 bJRLsG3u2x7GXLdYRKNztRATQbXOBvSiWZOtwbewcfevcpT1cqFeaKzy8LVKif4YCp
 moZ3dYYdMly+OCsY7mTIMk/+in8WBZi3sHl+fPl7cvXvsv2aCItmE36TaUhLI3jfV6
 ug5cPO1ShVIjtXioziDpaXn77Z+tBfIdHCHxaodC7rIqA9b9YI0OzIomC73J/kln/a
 rsg0ooJaaismQ==
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <31K3xupK1-7HNWorHqIwGwgEJl-1XdFjUQEoNYm6yB-lRoZ8kq5quRji_r3mzPZ0bUayLef6xPfQDiETgZp9lR7vUpDn2nB_37ncSd-J0Wc=@emersion.fr>
In-Reply-To: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Wed, 07 Jul 2021 09:07:39 +0000
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philippe CORNU <philippe.cornu@st.com>, Matt Roper <matthew.d.roper@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

Thanks for working on this. Do you have plans for user-space
implementations and IGT?

Thanks,

Simon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
