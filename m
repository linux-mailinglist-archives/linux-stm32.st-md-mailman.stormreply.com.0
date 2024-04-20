Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6658AC441
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 08:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 311F3C7128C;
	Mon, 22 Apr 2024 06:33:58 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53583C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 23:00:30 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-571d8daff86so1609643a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713654030; x=1714258830;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
 b=EISXjMoEYwxIBE5CVUO5RtrGYqzwsjFQkKeISmQCL+RQx0F0LQzC75aFaT5HvPW0jD
 I2apMf7MkesIp4imVw+3yOA2hmliE+3iHYqwZeLNKNfv2UwUcxLjDDBRgAx9A1FO3a2e
 YB3+dxIzpNkNuFLkteNfMQLOGhGBGK89C52glHAMsZW1CWe9p5olAVT0XV+BMJGBKvyM
 dRXdchA8cw2KlpF4kQQ5jNuqoxUEZlNDgJsoGCNFMuykYWSumBMumW8yNE8DDh+NiXQK
 wSh6eLnAFmXe7/ABdR8c5ht8xhRl6eum9MpweMb0Mp2vxTDazh31zhmS93VmIUeb1nEx
 LlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713654030; x=1714258830;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
 b=s7fQxWQ4QoL81/duAHSkKwerSwwhbGOf4yfs/xKqT5M6CaIwsqwUloRWxgZn+PDyZX
 CsGha+oCw1cre+CsI9BxFUglwBcTGL5djxevaupc5apq4VrjfcQy+xVlcUr866O7NEPK
 BJLlevhl/rv0Ck4k83xZX/UumZmpo9MZcNxRP82WW79/jpiezNX+y1SXepCAwOBTMLy3
 LUr1OH5j3YB4hC3/3UAI9NzqwAIOie8/XbIuRenJcIajilzROKxEISZRjZ/qm+cuY8mX
 lOzPc+uUP1v2NUbQSA9tIqpICgAQBoRsPD7d4fCRwzupYDT0tAgDQifuJSOiS4tki0EK
 E8Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2+jEcRnk6nEEnt5v/75al+ldkRs1DXKdBqE7Ob+vQ4auW28qtbmIpKF+L9g2Waki0V8LUWy9bVYONw/mf3j/e7gT+gJ9TYrHpC+vHqzlIUW42OwubE3g9
X-Gm-Message-State: AOJu0YwcQofTYYB9ag7KRLvItzO9zEHtH73JdoaUznU+WyRAR7Euoiza
 LK9UDjPYbYCdEgk1KTdjN423FWmJAcncRiAXPcidgk93hJjeRC4ddxV/qRfm6AM=
X-Google-Smtp-Source: AGHT+IH4lwqPioLpoIzW6dLhOLlXPP3zMShUOxH0TJXNnW3DIij9PpcqOmEnmKfQrSavTUI2UaMo9Q==
X-Received: by 2002:a50:9ece:0:b0:570:cd6:8ef with SMTP id
 a72-20020a509ece000000b005700cd608efmr4297896edf.29.1713654029517; 
 Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
 by smtp.gmail.com with ESMTPSA id
 eo9-20020a056402530900b00571ef2c1308sm913940edb.12.2024.04.20.16.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Message-ID: <9f44c386-4be9-4904-bf67-f0e664773baa@linaro.org>
Date: Sun, 21 Apr 2024 00:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
X-Mailman-Approved-At: Mon, 22 Apr 2024 06:33:57 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 01/26] media: pci: mgb4: Refactor
	struct resources
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

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> The struct resource end field is inclusive not exclusive, this is, the
> size is (end - start) +1.

", this is," doesn't parse on my end

"i.e" => that is, would be more appropriate I think.

"The struct resource end field is inclusive not exclusive of the size" 
which I still think is a confusing statement.

Perhaps something much easier to understand is called for

"The struct resource end field signifies the end address not the 
relative offset from the start field i.e size == (end - start) + 1.

Amend the .end field to specify the end address not the relative size 
from the offset as is currently given."

Other than that, I think its reasonable to assume the mapping != 0 - 
0x100 inclusive.

Please consider updating your commit log and if you do add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
