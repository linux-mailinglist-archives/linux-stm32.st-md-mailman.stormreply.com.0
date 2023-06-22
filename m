Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C385373A51E
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 17:34:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 703C3C65E4F;
	Thu, 22 Jun 2023 15:34:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F297C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 08:13:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3fa71e253f2so3404875e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1687421600; x=1690013600; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IxLUdJmVd0ETDzeyKPn7SZFc1uqf2kKlnDi3sO0D5bA=;
 b=m6S/1aChLob1kPwjzOxRWbVw6phKHvBwUuMbKgJXFUUDIVeEMYZwHU0JRSddKN/F9T
 X0gPncN2Cr00y6wzOB0ZoQ34oYQYjz+3bMSV5rpBfJABPcSCwjCrEl6wvvfjv/65ObHj
 gonKAPHtf+BWGYyRppoeSQEF2iNhfiiVS/e4tF8CxFx1Yugub1I7Bj3p+S80Chi0S8Zd
 wgmTZf+AM+pg3bZpsuzSdDdbSbijID5YA6/+ZLkBxQbwrvBO6c7uZP+KyGJzKTqpgFrK
 WkrWDBUOVpsUJ9gn0QkU1WpWys6Y+OZmIqUYX7aqPtUEhANDwtePae81z5QuG9Tk4nkb
 MVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687421600; x=1690013600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxLUdJmVd0ETDzeyKPn7SZFc1uqf2kKlnDi3sO0D5bA=;
 b=k2jc37LBm8cJEGsbHAxlE9Sz29CVawCXkCH+KNqJ1Vw5YqalkwmxZelEekSCM9ocK2
 jIgiITfKbFjK7hk1hzshhHKmo/3pv12klvSNcNftARBSc9npjfNEUYZEWj3NBsQvoemV
 0gezTa/M2zRN+rB1kJZ9nmgjA89r2Tm6AlxMmIGIknp/4P1MLBo/6OucZ0AghOE468d8
 FCc6I8BDBS6Jbh7aNnYseNm6vcCLUU+agFmkdj0YMXiUXtbXhYA9/px7x5rDtz+JfzC8
 rMALVvqZ0iOSGX736foiz2Z5zQg5zwIkCzpX0WJqgAwQhyGWmNexwLTGgyixjL4HqjfI
 y4SQ==
X-Gm-Message-State: AC+VfDwHjUQvGqZ9ILhP/UVwJyTL+GeNwonKr/mgPmOzNwijv0jysMzt
 J8dWDh8vHzanEPre8d2A6pzywQ==
X-Google-Smtp-Source: ACHHUZ5/yVN8oCoK0xe5hZIq6nL4aj3WkftYMpUVpR0rf2ivexC2SAnBmK0FQvOJ5tZxjRcF7e/i4A==
X-Received: by 2002:a05:600c:4e92:b0:3fa:7515:902e with SMTP id
 f18-20020a05600c4e9200b003fa7515902emr625228wmq.16.1687421600301; 
 Thu, 22 Jun 2023 01:13:20 -0700 (PDT)
Received: from localhost ([86.61.181.4]) by smtp.gmail.com with ESMTPSA id
 17-20020a05600c231100b003f8ec58995fsm7070435wmo.6.2023.06.22.01.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:13:19 -0700 (PDT)
Date: Thu, 22 Jun 2023 10:13:18 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ZJQCnny4pLY3qpYQ@nanopsycho>
References: <20230621135537.376649-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621135537.376649-1-brgl@bgdev.pl>
X-Mailman-Approved-At: Thu, 22 Jun 2023 15:34:42 +0000
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Junxiao Chang <junxiao.chang@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix double serdes
	powerdown
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

Wed, Jun 21, 2023 at 03:55:37PM CEST, brgl@bgdev.pl wrote:
>From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>Commit 49725ffc15fc ("net: stmmac: power up/down serdes in
>stmmac_open/release") correctly added a call to the serdes_powerdown()
>callback to stmmac_release() but did not remove the one from
>stmmac_remove() which leads to a doubled call to serdes_powerdown().
>
>This can lead to all kinds of problems: in the case of the qcom ethqos
>driver, it caused an unbalanced regulator disable splat.
>
>Fixes: 49725ffc15fc ("net: stmmac: power up/down serdes in stmmac_open/release")
>Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
