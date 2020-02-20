Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F86016684E
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2020 21:29:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D490C36B0B;
	Thu, 20 Feb 2020 20:29:44 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D490C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2020 20:29:42 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j20so4962255otq.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2020 12:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4y11Rw9Quj6ChkrwsaKBH1Q0T5iRPrjR3ZQy3ZsS7xA=;
 b=K/Gy2kZuMcFooE9N/vZ6kh7ItP4axd44924W1oKUd2nj8kXu2YqWw6KLj1o3dXqqAB
 DG9DgaeHMvbaxWW8LWC8L+leNAoyafb3U+j21lbZfFz04vGSppJTWrkp1O5AqMIpJWd6
 X3rmHreVgcD35s8DsMCtWhlwuJ7Q0NyUR63/EISAjMOHtk/rn15GUDNCYKLuSPHpPseX
 cor7bCJJORzl2G/m+9vpg43uo3RWZgw/u+Aue0yv/yt5KC+YFjT7ArGj3w70zL5wauO7
 mB9u5YX1qd10/mFKMOmvUh2F7azJfM5DTiDQZ7zIUYaRPbj2r1nXNjj9lVq5eUY0BCmo
 kJHA==
X-Gm-Message-State: APjAAAXY1YwjoTEmD0hXIWuuar0nuS8eTFi17+/SBoCY1josmTKyC/O1
 UD1GUwRTMeX1VPLsytvdew==
X-Google-Smtp-Source: APXvYqxqNmvtY+8v4lmPFwBx32CjiYTpN6LA3c1fXpwH+kIAQ9BKjTQ21m1UkbGpGxeL1RGLpLDftw==
X-Received: by 2002:a05:6830:1d7b:: with SMTP id
 l27mr23581373oti.251.1582230581148; 
 Thu, 20 Feb 2020 12:29:41 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l207sm128716oih.25.2020.02.20.12.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:29:40 -0800 (PST)
Received: (nullmailer pid 7275 invoked by uid 1000);
 Thu, 20 Feb 2020 20:29:39 -0000
Date: Thu, 20 Feb 2020 14:29:39 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200220202939.GA6480@bogus>
References: <20200219161733.9317-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219161733.9317-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, robh@kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] ASoC: dt-bindings: stm32: convert sai
	to json-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 19 Feb 2020 17:17:33 +0100, Olivier Moysan wrote:
> Convert the STM32 SAI bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> Changes in v2:
> - use pattern for compatible of child nodes
> - rework dmas and clocks properties
> - add "additionalProperties"
> 
> Changes in v3:
> - move clocks properties for st,stm32h7-sai compatible, to 'else' clause
> ---
>  .../bindings/sound/st,stm32-sai.txt           | 107 ----------
>  .../bindings/sound/st,stm32-sai.yaml          | 193 ++++++++++++++++++
>  2 files changed, 193 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/st,stm32-sai.example.dt.yaml: sai@4400a000: 'clock-names', 'clocks' do not match any of the regexes: '^audio-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1240792
Please check and re-submit.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
