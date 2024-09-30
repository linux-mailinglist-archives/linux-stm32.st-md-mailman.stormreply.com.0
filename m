Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F798A7F1
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2024 16:58:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 358C5C78002;
	Mon, 30 Sep 2024 14:58:51 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07377C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 14:58:44 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7e6bb2aa758so1710323a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727708322; x=1728313122;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Uq6kqoFKN3iUQrNTZUafncGjrGuFhq23v+UUWt2olZk=;
 b=Y+p+3PlCxlEmEf3K9AusCab7YNvA+PKlfE7KgXfhutQdJRAcRqqgWA+RU0SuFzD6yq
 c72Q0gIi130fGUdWwziJR4hFR3b8S/E/ubHsUFF0tnaYIgqF0r4oz5iKei9jpEKbswaS
 6jdLirITdR3Gqm/joD63pIAEsCFhTV0b5pOoacYgOfktnkZFhgVlUxYSAoOYUJXkNgCb
 6YZ5/mhPpwqU92yJIsN+VSaorBeyvr3W/4ZUxcc5/awhWelcT9LeFv9eWse5Q6fTIRIK
 6xyyjGEBv7hMMg9q/2NKANvPVgBZJQCbU3VjQ+TbQ1e5WuKpSl6VDhF0wW9PcOmMfhXi
 aYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727708322; x=1728313122;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uq6kqoFKN3iUQrNTZUafncGjrGuFhq23v+UUWt2olZk=;
 b=vziY9aGSlsBB0caaZK7b9+U0FvfrwtRD45P9b2CaZOhqqKFtUPbhF9wzlqmZ2+HW85
 bRYQKYYUMCc/k8rf7JUqgipL8eXModqVzvI5m7Y35V+9c1n/Bjkyje9U5i3yaBt0LMQ5
 TXyONangi3KzE/HEPHG/4V+FrClcv9XfSkwkl3dcsx6H2lx4967RB/44YSXb9x8X0RrV
 JSTlspPjHwNwT8Qa/RhvVJSsOj3+DXajUEIbFQan3Y33ePZ5UL4dUWeW3GJ9Hl5d30No
 Z1XgJ8zA6L05FvYtbwbs5mqu8XTvmOURctuXmkUTnXi6+Qz7b8BLhFhgEf6V0TPQpQOM
 AWfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkEu23dr/kujeJ5FUtRnkOwWPP814gRTWKv2W76sbiQnjumTqbhanBaV7BOeM1FiYP/RV32nZtoiFK6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3aCImkKy/e0nw9dx05vcFh4ezFGgUMgsmsi4biA5R2iqCN7M3
 BCgsLgBNtVa66VAnwUSjzhU6Aq3ukFmz7/PYCt4MeTvx8QFTkwfa
X-Google-Smtp-Source: AGHT+IFyJOOjU1KJ81Si3MHB0VgW8MUJv70DoRQShJ2l2z2+eyBm7ib27FpM+fTfozEjJyGEGLwkFw==
X-Received: by 2002:a05:6a21:1583:b0:1d4:e418:c2b6 with SMTP id
 adf61e73a8af0-1d4fa64d8c6mr19293735637.10.1727708322414; 
 Mon, 30 Sep 2024 07:58:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:671d:78af:f80f:975b])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71b2652b50fsm6538735b3a.141.2024.09.30.07.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 07:58:42 -0700 (PDT)
Date: Mon, 30 Sep 2024 07:58:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Message-ID: <Zvq8nn-uygJFZVHU@google.com>
References: <20240926031457.3479350-1-yujiaoliang@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926031457.3479350-1-yujiaoliang@vivo.com>
Cc: ye xingchen <ye.xingchen@zte.com.cn>, opensource.kernel@vivo.com,
 Scott Branden <sbranden@broadcom.com>,
 John Keeping <jkeeping@inmusicbrands.com>, Ray Jui <rjui@broadcom.com>,
 Oliver Graute <oliver.graute@kococonnector.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Felix Kaechele <felix@kaechele.ca>, Joel Selvaraj <joelselvaraj.oss@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] input: Fix typos in comments across
	various files
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

On Thu, Sep 26, 2024 at 11:14:43AM +0800, Yu Jiaoliang wrote:
> This commit fixes several typographical errors in comments within
> the driver/input directory. No functional changes are made.
> 
> Detected using codespell.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
