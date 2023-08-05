Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E022F771052
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 17:04:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 773B3C6B46E;
	Sat,  5 Aug 2023 15:04:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B2CEC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 15:04:41 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1bb91c20602so6523385ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Aug 2023 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691247880; x=1691852680;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ytrMVlVv1UK/Az0eboWXoW3oWMRE9Ry5HZu9EP4O7Hk=;
 b=Mk+wLubbtaR1qwT8sRDFUvnGC6q178WVxAnUzZsXJqb78Bi7HyfLQv37e9+cNYgtfe
 MQvhVW1w9wG3pNf4iVnRViD6V/Mp8AnkEDNpASleivqmUYhIGhJpXanqfrXnkYmH4UkV
 Z2yHlUV1PM3SllRDNxjkTCraMkCryDBud3mNwFmocYm4pJPzqEP5n9/f3GHoM7Vniqar
 Q4xrpQDPfaXefIboS0GHi0BJ/79Le7cHAmeaRjyEPJLEySe48L5MUbzRO44rI+usXfNE
 qJVZhx5e3aSLKKKtUdKrWrKZZgtoCXVv2WE/SE6BSueIAFzmL6a4pRD+DJWqZWssDr6p
 NOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691247880; x=1691852680;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytrMVlVv1UK/Az0eboWXoW3oWMRE9Ry5HZu9EP4O7Hk=;
 b=lfEoY37KUtdJkBIKBG0BPdJghvYN0KzVcUKKSDFhBaeXGrLmZZL1lspH+UixIOSwrD
 lura8SunnT7HAXhMcQK1QJ1QqkAy4ftUzVJci66c9xeamDI2Kdb9YDMJ3Bdk0jyvrRJJ
 m0u3S++gOUc43lPuYIceXsRyjUy+QJhw5PwFyeGtCE0CzzlYDTFOfz6cSgeMYbvjffJw
 vgILP8a5cDYYii2r6afpIUmIwSWTSxNbdI82bqNq1pc12AYrb7klNRN7h5tkJ0hwzphY
 OG/cKTn2ntvjX7skKl6gCMhfM9Xix7kRIuZqPhG0tOPb5StSmvf7x3m04RQcXef+yGkK
 lUcQ==
X-Gm-Message-State: AOJu0Ywvu5SWOZl2AG7BwCHCMqmYC30pkSFsxDaIM2vXJ6CJggKxjIYc
 /PE41Mzc7NlWJrmCMCldCko=
X-Google-Smtp-Source: AGHT+IF82ItI3skCFLQdfd5ecBJpcyON+saJ/4iH20OqWKlhvzIiHpi4OFMsVyx/ucee9F5mPKGlig==
X-Received: by 2002:a05:6a20:8e19:b0:140:5067:84b3 with SMTP id
 y25-20020a056a208e1900b00140506784b3mr2213271pzj.0.1691247880108; 
 Sat, 05 Aug 2023 08:04:40 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a62ed06000000b006870ccfbb54sm3263234pfh.196.2023.08.05.08.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 08:04:39 -0700 (PDT)
Date: Sat, 5 Aug 2023 08:04:36 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <ZM5lBG+eXG9WukOV@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v3-0-61e63427735e@pengutronix.de>
 <20230804132403.4d9209de@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804132403.4d9209de@kernel.org>
Cc: Johannes Zink <j.zink@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, kernel test robot <lkp@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 0/2] net: stmmac: correct MAC
	propagation delay
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

On Fri, Aug 04, 2023 at 01:24:03PM -0700, Jakub Kicinski wrote:

> Richard? Sure would be nice to have an official ack from you on this
> one so I don't have to revert it again ;)

No objections to this version, as the correction is behind a feature
flag that is opt-in per device flavor.

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
