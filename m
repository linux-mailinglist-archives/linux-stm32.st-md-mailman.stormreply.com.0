Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E59DBFDCA0
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 20:13:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A23CC5E2D3;
	Wed, 22 Oct 2025 18:13:56 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0249EC58D40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 18:13:53 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-26a0a694ea8so51302465ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 11:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761156832; x=1761761632;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jLJgKW63U3laQ8TNHosGYPDklPCsb+gg1+m7SNDlD30=;
 b=DOlc9eraUKX8pwVbehMIjb3mJqmFKJwYSFXyUdAnAg99r6j/MP3oy2yE8johkYtS49
 Gig8AiV6IPG36NLN25J7s8pej+FO6xo5uQatqt4zFeBsMi21glgQw/SEUHjtKm1jdG4m
 fAtXHGCWksIsZNvlyjuJJ2o9gx5wTPak1DVR4NR8sS/idCuemkh8ZjKkqHzQ1B4qsUXr
 0nCyftTaTGdv+JqXykOrDw50uDN3bgJgBnJj5ZfmxfIE/mgtC/wGLJa7q48wRPNH5kby
 sKu0oIgxRF394ZL2l8dkxPJ6O4VR3X6+DNezd30FbT74qdwWHWMyKf84VPUahSH8KeBR
 8KHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761156832; x=1761761632;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jLJgKW63U3laQ8TNHosGYPDklPCsb+gg1+m7SNDlD30=;
 b=vPQmyXa/rzKm7J4tG1BGt8CBFkS4O3LjCRuqS5aqoSBuaYH6KmM06CesPlP3KEnsE5
 gtDQCKefI/OopqNwB8zE9ypr8U8dU+0ovolbIpG/x/84uZhHjcrobrcG+DgPI9ngvu0f
 W/15MxFz8s9lM0O0k6X2nNyvdoNd8opJNzmDEHUtgP6xxqJP9dpMFpaoV/HXsDXHra1K
 n5e+cJXasFlupWCM7GVhWzW4AL4KEoOpWJazTPm0WxQf5oPDxIED5Y3eMbSYqt1f67GW
 Da83Bs/+e7gknkkZ853+CONJqtoHqWD02tHDOUlQw6eM/Ypqsj/4IhUMMC4cKvFFLW9O
 bGuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVZUYQJoZ3/obxyS4p/EkT40fe4fKcdO4WlB5YnqtQCI3zZlCso/ZFaspXjJ6fA1cGtFjbFA8tSqweKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxIL4ZwxqEk1JWuipwnB1GDFmhNdn4EUuoK4UKB8ZAmURULUKkm
 4jiiKC8vD+ct3sEY4oFo6uCBPrnd0wLYJv0z/9ivTLWaNEklXa2PbdiW
X-Gm-Gg: ASbGncvK92RQWGAXxLEdCXOnf9bxdSSUYh13dUUbe8yphv7pQrGUuaTxh49WEScWRuH
 RhNr3Wbc0K6h4+5W6k/gIxlpGo96Hakg2cemCSub7yvNxYBloClfP/ar8HpMJXkJ5RrmzVUaxhc
 phzMuuu3OzkE3+upwZVM5l818GaDiyTGSZ1oaP2/unPnkn18vQSzAKBPdhFnh1OubDDpPVrHenK
 IbLCQztPvL7nQ0pW8msRq0ze3th7+mcY9SNR7uQbdRQUdMp4Rx7TtS3r49EPUN9mec/NbDYOppM
 1prGqKL+Si+aHP1dBOOQJULa+mDitlPF70rkE3tTzeagiA1Q6fA6aRbygWN/1dszVhVFtN5Ct2O
 +82PVnjBXL3qAbkeITjMjU0cOaLnvWAIWtgtKf4uHS6PR2U9BkffvyKGwc0MYDiyfCvz2tyT/Qq
 0REKG5E4pO0RHmgXiYqFBSJ2LIDZFgNM9C7A1aVQ==
X-Google-Smtp-Source: AGHT+IEKSvBBS8awXEhQRZuuE4/RFkGN+a9c8XIx/ZTqTS76us8OMEo2zvvCAOTGGDCXlFKP7uLGXg==
X-Received: by 2002:a17:903:8c6:b0:28d:18fb:bb93 with SMTP id
 d9443c01a7336-290c9c8968cmr299698995ad.7.1761156832260; 
 Wed, 22 Oct 2025 11:13:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e22428b1esm3212795a91.22.2025.10.22.11.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 11:13:51 -0700 (PDT)
Message-ID: <82e4adab-73b0-4ac7-8c29-718b12a73468@gmail.com>
Date: Wed, 22 Oct 2025 11:13:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: phy: add
	phy_can_wakeup()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/17/25 05:04, Russell King (Oracle) wrote:
> Add phy_can_wakeup() to report whether the PHY driver has marked the
> PHY device as being wake-up capable as far as the driver model is
> concerned.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
