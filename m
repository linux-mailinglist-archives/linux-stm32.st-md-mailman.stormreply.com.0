Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8067DB95B
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 12:55:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3161AC6B44B;
	Mon, 30 Oct 2023 11:55:28 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07A33C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 11:55:25 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-53db360294fso7331463a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1698666925; x=1699271725;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q31c8fnQHD+W10kmomcQ4zTSAMbkT+bVtaWYEa58nas=;
 b=Tfn0AHWX8zU0tO3yci31zUe64LaiyMfOf3z1d/47sxVoKlNkkuvROYvi45b9PJ1JXj
 kVp5EfbIlNFxzCTrJuz+EySOp7mXbiBMRdZbQBL2OYbejluifGQn0AFOgsCHGc7TEj5R
 lAHhohAlCJWvoR0MZSvhnBnyXTfc71JLBxF7d3m0W1B3W8l7FRo/33QSZ+ThC2CPJxbo
 SF04hMijU/BwddV3EFHpTpj49L0QVOphkJcd/PEL3Bw0hxd5f+GD/ja36j3Wxbgvpzjl
 4uEQDMVjGqXct/a+g6vIUBbF9uxUy9AonZr6stRPR9ncU9Tux4BiGyAfxymHCWnAqd2x
 imsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698666925; x=1699271725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q31c8fnQHD+W10kmomcQ4zTSAMbkT+bVtaWYEa58nas=;
 b=Of1Cvnn2kGo3xHsrYZyXHoVz+NBB39IS6XmGOBcVLZS5HJJ5KpIS8hpwWNVUoex6mS
 lZQInvIEUwe3nhP4us28PuHDRZmcMplEKgkatHg0fOvXEDPbWyjqi9a3Zsqzl0n/x1z+
 wGxdr/6PvBeRaciJLAZV4/zXnqbokP/xxf+EEaUd/4ZGmp+Jb33eQQpSxJNBZSRGGama
 m0gv+b8yKEVbMVKZTcyygN1/iocSIxjpnZAI+cyjJ197+h5sL/8+shQ6uYrJwBMFmJtb
 IHOMTSxk+WCu7j6Ol1RFNm61920Iq4lHkLe2mjBEsvUH2hl9fFvjbZ2EQsMeskEVfvx5
 w9Fg==
X-Gm-Message-State: AOJu0YyC8XnjbQm4VcFm2qimlbXWw759jb9fkzlai5uMXwk4v0sPAT3X
 Qhd/wq808vGgfL1mp2OYjxx3LQ==
X-Google-Smtp-Source: AGHT+IEK0FVzrhD+/lsg/GFhSKbE3HoxQjpfS+HOYJ/lF5CE71Yh2/i3l6Z4QGe2FLuRhkkWz0rUHA==
X-Received: by 2002:a17:906:c14b:b0:9be:ab38:a362 with SMTP id
 dp11-20020a170906c14b00b009beab38a362mr8139316ejc.46.1698666925439; 
 Mon, 30 Oct 2023 04:55:25 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net.
 [213.179.129.39]) by smtp.gmail.com with ESMTPSA id
 lf19-20020a170906ae5300b009ad89697c86sm5944350ejb.144.2023.10.30.04.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 04:55:24 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:55:23 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Message-ID: <ZT+Zq4j9iQj1+Xai@nanopsycho>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Wait a bit for the reset to
	take effect
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

Mon, Oct 30, 2023 at 07:01:11AM CET, bernd.edlinger@hotmail.de wrote:
>otherwise the synopsys_id value may be read out wrong,
>because the GMAC_VERSION register might still be in reset
>state, for at least 1 us after the reset is de-asserted.
>
>Add a wait for 10 us before continuing to be on the safe side.
>
>Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
