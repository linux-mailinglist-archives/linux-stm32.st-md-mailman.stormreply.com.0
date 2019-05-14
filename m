Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8051D043
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 22:03:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B39C6C35E02
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 20:03:06 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A35AC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 20:03:05 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id f4so73811oib.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 13:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fr00WeJI7LuY/N4++pQHRnJwZ0q8ePUBZpSaqAUAGZM=;
 b=cO32zItEO9+lCzvYxS/szkob/7GXHVJIQ0IcICtAS6GPiTgYQkkCZ82DJEIi5bCGKr
 4WWXJofQ4uDQPQrplqvHssDXWRXgsWXxbc4zdrc2PdgwlWPkMtOotcfrj44MkEqMc0ed
 rULmVlDpRnBoLg683kA3TX1me61/nj7qI4DGVbHp84CAz0HQ94LySxBl4OMsqZlteeF8
 XOZ771TAT/n8/1ClUn8mFuY2QgU7OYyee0saVvhT8nvd5xptFJHsfmZr4au2/DGN74Yr
 Pt/c9CzPMXVGEYhdBM+OXSc2/XR+I8XMLJlQ17brhCQss5E9YfvIHdttjG5BZ9MWQhrf
 nDZA==
X-Gm-Message-State: APjAAAWCGDsdXn1f0ucGlP3yzhl57UCdYpes1aaaLbf8xOJTPLJFlHJg
 +ZksdJ1r4s1PbRT98pHDMw==
X-Google-Smtp-Source: APXvYqyyGrngDLkf4JtW5jGewq3pbgcF+xgmfak6/x/AXfJYI3EEMCP71iIcdP81e9ElCqbZBI7PHw==
X-Received: by 2002:aca:56c3:: with SMTP id k186mr4070933oib.95.1557864184052; 
 Tue, 14 May 2019 13:03:04 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e133sm6577619oif.44.2019.05.14.13.03.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 13:03:03 -0700 (PDT)
Date: Tue, 14 May 2019 15:03:02 -0500
From: Rob Herring <robh@kernel.org>
To: Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>
Message-ID: <20190514200302.GA10115@bogus>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: display: stm32: add
 supply property to DSI controller
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 10 May 2019 16:20:19 +0200, =3D?UTF-8?q?Yannick=3D20Fertr=3DC3=3DA9=
?=3D wrote:
> This patch adds documentation of a new property phy-dsi-supply to the
> STM32 DSI controller.
> =

> Signed-off-by: Yannick Fertr=E9 <yannick.fertre@st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
