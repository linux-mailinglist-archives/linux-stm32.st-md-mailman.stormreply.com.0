Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B386C58CB1F
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 17:17:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61293C04001;
	Mon,  8 Aug 2022 15:17:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41B97C03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 15:17:14 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h13so11276177wrf.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=aEEhusA2uO3xOlijgosxmVncGIW0XNq+zhiCAYCpbsg=;
 b=zttKVRlrIAOc38bj0MZFaWmrn7v4G2JZHrXcj7BDj4Env6G4AwrZi/Y85unzwlT/VT
 5g3H3ynUIwRcYdmrwXQN6y+2kse2fNwAAO8FE35IsnysmkTI4+aD+FHFWKtlqE1bBqiF
 CqjAgcPoaAXr54rS3IR5YYGlpfUa8eBfZWRBuSm1YH7UbCmkYKOSLTgzcl3MVUSS3gh5
 XE/F+tRaaPbB0vSlZ+6veOIvQZcYQ8Qp8Gel+9oIWGlijz5UffmXanzUz0AJWHZQieIT
 hMsTu9L73mMtGCeDbItrfep7M8oY8ahRzW+E3oxNuCVZMfhiXPoWUYBTVdYhrPgoJC0B
 pCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=aEEhusA2uO3xOlijgosxmVncGIW0XNq+zhiCAYCpbsg=;
 b=TIl6hrood6rOIaLl0fPhFNrmvBi+qMyXnzzx7Z++kzGhMr1FX0QFi1AekwpfQBMbG1
 i0628XMSiWV3qQG5dpQnLNlTPvJCPPZWIJ5UN0F+PtNYbh033Zf5rvyTTPAsCnAcFDMj
 qITUESyUWmLj5ED2xXvd++I9YRbvVo8qKjS1pulZjxzkezRsOdToP6vhisRWia2d3bg5
 t8ZaPFWyULijvJV6ZLJwsvxdxSF0VlEv3tF4D+RB8GN9ny2kLwFpFqRS/y+d+a0c1sG/
 rZWcuI6U/M5y+yDtNwerh+onND1tf0o7HuGdxseL6aWTovDcL+AFrDsXwGL38N0+ULfH
 ModQ==
X-Gm-Message-State: ACgBeo34BPHvugb0nVV2cfB17lqVvkLnu/l2PerzIj+UgDuSoMy9TraY
 oAKh0JkYGlHhotEFOR/iNVQx8g==
X-Google-Smtp-Source: AA6agR4nqJfrXw3Y9cimqQMY1rskwGr4WzCVKXIdzR4n+rXaRE6zJbpwUZCJ3pwH9RFOFaKqVD2YfQ==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr12457600wri.39.1659971833810; 
 Mon, 08 Aug 2022 08:17:13 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2e89d1fb5sm19346419wmq.42.2022.08.08.08.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 08:17:13 -0700 (PDT)
Date: Mon, 8 Aug 2022 16:17:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Message-ID: <YvEo9325xhM2fMGC@google.com>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-2-francesco.dolcini@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712163345.445811-2-francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] mfd: stmpe: Remove rotator block
	from probe
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

On Tue, 12 Jul 2022, Francesco Dolcini wrote:

> Remove rotator block from probe, it is not used in any device tree file,
> there is no related cell defined, it's just dead non-working code with no
> of_compatible for it.
> 
> This is a preliminary change to allow probing by of_compatible and not
> by a fixed name.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2:
>  - new patch
> ---
>  drivers/mfd/stmpe.c | 2 --
>  1 file changed, 2 deletions(-)

Applied, thanks.

-- 
DEPRECATED: Please use lee@kernel.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
