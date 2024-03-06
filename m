Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4F873C7B
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 17:43:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41684C6A613;
	Wed,  6 Mar 2024 16:43:43 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48760C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 16:43:42 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-4d34dadcb23so1397793e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Mar 2024 08:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709743421; x=1710348221;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+CzHKJhoZJ9L9/JumXPgp0DQ56z60RjeIgEzaXkgl64=;
 b=P64O8nTMlqfP9t55j8AMUnE7NvaMRxTbvRki6x5cD77SeORaBruryoPN36fXcM+G7J
 sBz7hN/BZGdxcpz12R1Goq86AakRgvivDTlJ5lNvbi335TheZtXAVSi652RJ8pnnjsKt
 qd/ejt/XbvZAe9UFmLZa8Qs4YGDAA7Bnq7XKlrajCDiNu5mfBE43EyrKEj0LY/Yhq6ii
 rccCuN+CehGD3bgDkyf/P1J4yYfVaHJixpMtFeFOiKBefVonBAgDzYY49Xaxp7yf6++d
 7kTT8TmwF3pfAiabLm0wPXigcEedlpImasVW+LoLU5J2Iq/SHdqkqVixuuIVo207Vmwp
 4L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709743421; x=1710348221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+CzHKJhoZJ9L9/JumXPgp0DQ56z60RjeIgEzaXkgl64=;
 b=g0TVfY6qdX95JydOLfkt4g2forkFWIFfMbCbTusPsGuUplp2J85PKyiAzLvmkRu+eI
 NbJmskS3ONhYxc21KJj7kEjOD668DEjCSCVTeyUNLE7nT/FVVMFuSDI3UypK99/8mm2h
 5n2xpgK0bO+paAVDU+lC5RVIMYgiaLgrUAVDJiq/D2qiVWiKWmxOHE7nzFaGPGAa01+3
 yIIf9WSrOjBcdirY+msyZi4L07f+aaHrIILBoMjuvMnK8gLVUsC9zRXttsOTHGpP/ET2
 56Iw+My3CPSNlxi7lJIl7vmUTCiYJ4y9BkmAtHCR8cGza/triM8uSlEOqC3WRqOUM2vv
 Khdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJZwKrFRY1MW8CwvRJxE1fn9vgaDpzgNBiykJF2cT/WnOp29SJr7MCxdd89nUNI8CDuXW5m+Gd+MZxLz0lo0w35lkT/mM5SphewIKdyU5g/O3txP7gHecS
X-Gm-Message-State: AOJu0YxhIpHhWvg4T6rR5iqyaY58TnIvE/1d7+Df1R4ZE4hcebyY8vOk
 gJ8Vy/PxEIboV6m4Nly+8TAokEMKBKHwheOnNEcZB3imquHn2Njo9YuHLOSJW1M=
X-Google-Smtp-Source: AGHT+IEtqKs4f+XSGVsSLHNo1vi31Z+1UVpK7SSLgkuapm9nCa1m0G66gdX1EHLx1QeDvVmUMUFg2A==
X-Received: by 2002:ac5:ccc7:0:b0:4cd:20ea:35aa with SMTP id
 j7-20020ac5ccc7000000b004cd20ea35aamr4880544vkn.8.1709743420987; 
 Wed, 06 Mar 2024 08:43:40 -0800 (PST)
Received: from ishi.. ([185.243.57.249]) by smtp.gmail.com with ESMTPSA id
 ep15-20020a056122390f00b004c02d68e4ffsm1628459vkb.44.2024.03.06.08.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 08:43:40 -0800 (PST)
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed,  6 Mar 2024 11:43:23 -0500
Message-ID: <170974334053.40130.15652602513065815985.b4-ty@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306153631.4051115-1-fabrice.gasnier@foss.st.com>
References: <20240306153631.4051115-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Cc: vigneshr@ti.com, linux-iio@vger.kernel.org,
 William Breathitt Gray <william.gray@linaro.org>, linux-kernel@vger.kernel.org,
 jpanis@baylibre.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6] counter: Introduce the
	COUNTER_COMP_FREQUENCY() macro
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


On Wed, 06 Mar 2024 16:36:31 +0100, Fabrice Gasnier wrote:
> Now that there are two users for the "frequency" extension, introduce a
> new COUNTER_COMP_FREQUENCY() macro.
> This extension is intended to be a read-only signal attribute.
> 
> 

Applied, thanks!

[1/1] counter: Introduce the COUNTER_COMP_FREQUENCY() macro
      commit: 0e313270e0e91e8d48be7a58e1622228cf9e53f3

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
