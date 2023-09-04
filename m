Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E77A2791515
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 11:52:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92552C6B454;
	Mon,  4 Sep 2023 09:52:48 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83F2BC6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 08:00:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A8395CE0E39;
 Mon,  4 Sep 2023 08:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D61C433C8;
 Mon,  4 Sep 2023 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814436;
 bh=msH+AlW1tcnzrzUkcVH/Gu9dCYW/mw+O6xT2pWlSs9M=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ka9xt4kMgaXoKCttn3PTsy/pLUsanMSnIUZu5nMztBnSY0Wdzf6Dew7ALC7I+Rqdb
 ZtFVsXZ0oRdRFZ097j4GXusIpKe6qP1i8uQ060FdShTuPNNV7+Cf12ScsnQLXx2O6k
 hJsXvyjbbEc/2PmpFJcdizh2eKOeUXKmg+lxtLBmnQvq4kDO7fATE0ZI5V/EbxvIeo
 /hf0eGtgU7PesSck8b14tvH1M2iSyEmpidZw0ou54S9x+U+JsZO8IozatJNez+bGKq
 Q2T9/AIU9uHcBmHafOGNfIuDXOb1yZhv58vQFjLoAjQ9cBhnENTAk6MAlYEO4zn25J
 RTzUxL16SoUBA==
Message-ID: <1506b6324d05084097f1971520d76fa0.mripard@kernel.org>
Date: Mon, 04 Sep 2023 08:00:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
In-Reply-To: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
References: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
X-Mailman-Approved-At: Mon, 04 Sep 2023 09:52:47 +0000
Cc: linux-aspeed@lists.ozlabs.org, tomi.valkeinen@ideasonboard.com,
 linus.walleij@linaro.org, dri-devel@lists.freedesktop.org, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, emma@anholt.net, joel@jms.id.au,
 airlied@redhat.com, daniel@ffwll.ch, Maxime
 Ripard <mripard@kernel.org>, hdegoede@redhat.com,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com, andrew@aj.id.au,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, jyri.sarha@iki.fi
Subject: Re: [Linux-stm32] [RFT PATCH 5/6] drm: Call
 drm_atomic_helper_shutdown() at shutdown/remove time for misc drivers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 1 Sep 2023 16:39:56 -0700, Douglas Anderson wrote:
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver remove (or unbind) time. Among other things, this means
> that if a panel is in use that it won't be cleanly powered off at
> system shutdown time.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
