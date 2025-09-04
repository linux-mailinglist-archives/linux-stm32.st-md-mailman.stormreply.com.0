Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9BB43C68
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 15:04:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CACBDC36B1F;
	Thu,  4 Sep 2025 13:04:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A0F8C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 13:04:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b7d497ab9so9984685e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Sep 2025 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756991056; x=1757595856;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJ2yny2AZyLw5kGAtNbOv6rkTL+h8EX2jliOx5kuaqM=;
 b=iYKMbtWlDDDBQdq3tGznEz0Jwwkh3oj3bsXx67XF2Tn1QIhrBpMARB8mloyg7v1RXR
 invJIX4Jm/D8qhdbOB/ZB1uGZKCySdjR/KJeStwtF0cUjnNOrCKUT5MRc0hiQ9WR3ByG
 m99i0CA08r1ANzriOyX+nkyCRbmJ+2EaftpqWc6frKNeLoXuHGzDxjE61YAOgGpISuZi
 1VS08KqMsnKBdg9IGQthsjjfVz/pkzfThtqrHVADu6hC7e8/tyLY/e0iDMjD2jtnmyD2
 Iy9Sd2o48sGuONnM9GbrRQkrtEeKhu0wxADTfuEI39VXFVQqgYSoUAKBAXu3K8KiQwaM
 C8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756991056; x=1757595856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJ2yny2AZyLw5kGAtNbOv6rkTL+h8EX2jliOx5kuaqM=;
 b=dFLCu7xtaPFmkkhZmY3EKUVP6Af9+k8GPiiwqKhJCu/eg6qs2GhfZBbpK1xe81XPNC
 WE8oVLTM0Tg3gXKK+u4zHc4rQKMGgK+cLOQYNNHHH1JFhlY7zxpbDvprN/pBbkaAiGX5
 PgvDyrVxgkkE5UoECysXXSPbfdAFf2WOozEPnw4arMrDhDIaJurt9aEwWB7FpxfuCKf4
 d4hplGn7mRweXO3SfnCs/BBMPJzYRkTP7S5GJ0RJBGBADtIfhuwXn0xa+iLFC4J7yAmg
 ojKcM88O8T5SYWMMzY3+KY/bstpFlSK/z0WGsyyU/rC5igh7dnZwgcOQRR8/ZZwPP7V9
 9bcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFzZxAkUvQpqspUD3zlw65QEFjIg9W5muHxuwgMTBqc49mXlmGZKWlfIoRU5S69xgVefbzqOQ60lCMcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx5hzLHBqKolMa5DlmGPc3j29Z3EnmzXEyAwFtcDJVgb+oY4GqS
 rtI6hS/XCFJ5Cm0ubbMLwg9iZz8uQ2yVspgI+/Bw8FEhzyliQeOLHmyHJvt7a3fT70Y=
X-Gm-Gg: ASbGncv3Dip6GkhKJ8zp9ddncdipgZNazVHXhGG0iS6ChRmrTE3dyUPTfA1Z1ZXYNQe
 /l205B3YOy/XtJDRt4Ba0HA3b18wmNMn5OiCuQxWTeCZGQTbPy64sfFJ7bJeB7xuYIO2o4UXalh
 QMt5l6C3zKqoKjtzSiq/L5HbuEo/o7gxp04HVG0gtucNkFjRigvLu4eg4NqF5XwLsRa/6+wgUkg
 PeYqhMKP++E85uU7+ltZXDvAgb8d3tMQk9YWLLSjdupw/wPcshmYuRAA1C4Cwvi/zKS/5c7J5kV
 FHC/n3GYQoER2RgjtnarxiJ+bAq+mk/OmdVBR422pjsabLxwOGVaK/18r5CNnNDbhWLQ/Gjoe9x
 +4S41qd9AYIkYHM8cEe+5kgs/knmacuClVA==
X-Google-Smtp-Source: AGHT+IGxBimr8IyZ1DY86cVwVfp94kA87fe9hUXm7C1nUfS6RvrRyv+/zG+v/lPCzgh/LN8QWSMvOA==
X-Received: by 2002:a05:600c:8b23:b0:456:1dd2:4e3a with SMTP id
 5b1f17b1804b1-45b855506e2mr155178225e9.3.1756991055686; 
 Thu, 04 Sep 2025 06:04:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6e82:a4aa:49e0:a7d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d701622b92sm16393258f8f.58.2025.09.04.06.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 06:04:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Thu,  4 Sep 2025 15:04:12 +0200
Message-ID: <175699105010.72115.9734506229516403389.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819070458.1027883-1-alexander.stein@ew.tq-group.com>
References: <20250819070458.1027883-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/1] mfd: stmpe: Allow building as
	module
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 19 Aug 2025 09:04:57 +0200, Alexander Stein wrote:
> Export the core probe and remove function to be used by i2c and spi
> drivers. Also add necessary module information so the drivers can be built
> as modules. This reduces footprint of the driver is enabled but unused.
> 
> 

Applied, thanks!

[1/1] mfd: stmpe: Allow building as module
      https://git.kernel.org/brgl/linux/c/df6a44003953fb23ad67f82d299e439e7ff7150a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
