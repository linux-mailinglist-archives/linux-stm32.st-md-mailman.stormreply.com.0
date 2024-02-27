Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D0C868C07
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 10:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C602C6C838;
	Tue, 27 Feb 2024 09:18:40 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBAA1C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 09:18:39 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a3e8c1e4aa7so394570166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 01:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709025519; x=1709630319;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTxdDYxyQ3IqtlRrYxG0cMi0muAaZV+mdO2HgBPhVk4=;
 b=YQi87L0JRnddiQxmQTd7TOQVwvw5Tmbk9LzSLT4tWXa53+I73REEmsJUjhFrl2kHBh
 NFFPDQkHeWlg5UPJQHWLFa0nJQkdCjaZYHHIZYkKV0HkVW132gbrKsAEkw7DhG7JmGSF
 7n/oA/bw1OIzwtbGPkr7gxRtsIGU0yXgIYs2o8+XGswQQXjR+Au5cJe2syc+t/ltzI7P
 vwi3CKoudQfUQDixU7yqn7AKXCGgMt0NeptsYgcYTOpcYfK/hFikXvUp9wqPyZmuLJIH
 vWSG5Z35mLngv07CudAXEUPnC44c/glCGmtxUNVrSVwIFP0PSl3O0ARUEEnFcT4CG7Vk
 ZI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709025519; x=1709630319;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTxdDYxyQ3IqtlRrYxG0cMi0muAaZV+mdO2HgBPhVk4=;
 b=tChHJ70+QiYWim6UCDYGzNW/wXsM9X1VKm9Db1CFa6vXXH6r4BqKd7cTIqEyLXwMGH
 Nb28RXC/PeFuegMQtBHtketeZGl+0shhNJzltiDVqu1Bimxpy5Q5DUj/L7EqDTvA3/vZ
 AFdrCPKFWV27pfyq0p5s6Stqc2D1mY3PiskOKp1kn26IVdmy+FcGuXGQsTcaHFlxmn6y
 62i4vAUQen3fjXbrWZgmWQk7hB1uJe7mndsBsZYr0HWptgc7o8MMXoVHaNekIJ7IyRT+
 /4ZkayWhI7ledPtbGb+i65BrLjYMyvAMjBdiwWXsbU1gleZ35xSolNORU2AyQNSyBWzW
 /kgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM2detwBt6AZMKq3xNvtf8X0r949PCB/+HzF5htei+vHi2o1x/DE1+73/4DtrD+fpGUq64f/woJSwhmGUn+lZiK4YHIyLcf2z9Y3FT7NAKEZHjPuj+jhAk
X-Gm-Message-State: AOJu0YyOlHo1WbO6Y5Y3kMcGpuDVYNsJtsip4bph/6uTwPeuJfoW8PMc
 u4n2LLJdmgYHuHaochtB4yRHPgBbaDRRBIcfnxy2E4l5a6w4ofNa3mlXdr3eOWc=
X-Google-Smtp-Source: AGHT+IH5qDiaCJ1Kc19hS+XkEPETptoM/fW2uFhb8X4AvKdAgnH5cE9EdnEx4zaM+SmijwWe1GLcsw==
X-Received: by 2002:a17:906:3c05:b0:a3f:4596:c3c8 with SMTP id
 h5-20020a1709063c0500b00a3f4596c3c8mr6253526ejg.53.1709025518961; 
 Tue, 27 Feb 2024 01:18:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a1709065f8b00b00a4395a7adecsm561154eju.165.2024.02.27.01.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 01:18:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240226101428.37791-1-christophe.kerello@foss.st.com>
References: <20240226101428.37791-1-christophe.kerello@foss.st.com>
Message-Id: <170902551749.40155.4302792627974952211.b4-ty@linaro.org>
Date: Tue, 27 Feb 2024 10:18:37 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 0/5] memory: stm32-fmc2-ebi: Add MP25
	FMC2 support
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


On Mon, 26 Feb 2024 11:14:23 +0100, Christophe Kerello wrote:
> On MP1 SoC, RNB signal (NAND controller signal) and NWAIT signal (PSRAM
> controller signal) have been integrated together in the SoC. That means
> that the NAND controller and the PSRAM controller (if the signal is
> used) can not be used at the same time. On MP25 SoC, the 2 signals can
> be used outside the SoC, so there is no more restrictions.
> 
> MP1 SoC also embeds revision 1.1 of the FMC2 IP when MP25 SoC embeds
> revision 2.0 of the FMC2 IP.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: memory-controller: st,stm32: add MP25 support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/97dcd1ef76412d0f25d2d50215565fd4d9ef91db
[2/5] memory: stm32-fmc2-ebi: check regmap_read return value
      https://git.kernel.org/krzk/linux-mem-ctrl/c/722463f73bcf65a8c818752a38c14ee672c77da1
[3/5] memory: stm32-fmc2-ebi: add MP25 support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2ff761ff29f6e2d0e616b21af3e054dac1f2c5f4
[4/5] memory: stm32-fmc2-ebi: add MP25 RIF support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/cc7d5cf8021983a736f9d963dda2dd45de02b395
[5/5] memory: stm32-fmc2-ebi: keep power domain on
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e46076906722ee6f9e7fd5abad7f909cd11a26af

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
