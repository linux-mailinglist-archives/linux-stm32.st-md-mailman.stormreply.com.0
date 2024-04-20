Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A908AC442
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 08:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 413D6C7128E;
	Mon, 22 Apr 2024 06:33:58 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0A29C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 23:07:57 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-346359c8785so2728864f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 16:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713654477; x=1714259277;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=;
 b=PEFh5hHKyvaqJd8VfpPAMctwT/G1MDS+Duft5veS3CMWJJt8hJUG+3SLGaylSQ43K8
 5/1Y0rqHo1TbjzDZlCWAp5otPIpha+ACh3quFtUwgnI7oWnDeZi3o0yYODSFIDT/4a69
 Bj+ODkBROcefFPRskUxhrZ8/qJhZaZfnl7s4Jc1mXif61tvBX98G5M/b9PJ3VeBEin4V
 +BqvFSxGy55JhRES1iqOXMTBpMLv/LQ+3+twZLFfWKO98YjTKCvBgOj1j6VaA8vvAlpD
 15Qr0ekLyF+vm4nopffCJKtJprE7VltZM8jilFDigI4rQfu57wsaor1ho/4jD/BmiTfs
 Lr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713654477; x=1714259277;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=;
 b=JTk1JxBhVMni79cntnEnYq7LIY24KPrVfOW9sTHPiT9Z+7XBUdH7G6XGBkWL5oOzLF
 4n9X9+26iAO7je1HHgjQgOExDTaMZYEHq7JowYhGQjQg9CByg7UpjwXMi4FJ/sO4oi/z
 KD7xleT/xHWfKenz1Ayitb+qiMX5yR87vDFc9b6EZT2Okx01tXOa6apcCTjxLTztE3g5
 vfDj7AIfEULN/YxOwz5boOEiAYhvYqO0H3sUnwXXYb3uJ+rkjKyw6q9DH1XPTvZ7VySn
 HGIub0Dh7994CslAj4walofF339w88Jvmf/62X4/qRz0x1kHFwj0UZCBcMEvSJfK4Vlz
 jwpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkQmo3fBLDHmFISISRVnWDt8W4LrVJgxvbqikEMpFUvm4UFO0XtQYeULmwVY2Y9DEO0QlZbPlJO40DsqBy63rixm57f97kaY0q6/DazJebCQTeS00wHS9v
X-Gm-Message-State: AOJu0YyHBb1gscyZ5G6B7mIawUUg4w9TN0pseSbzSZVpQ2pl5Z8NUxo1
 hQW8UCkzOrAv7SJxG879pcgoCbLeJ5RY9QGiCkBKqIpaCeVWz2gXBZ6tv9EzB6Y=
X-Google-Smtp-Source: AGHT+IFGdOa11zFVqyC3KCcGi9RrrofVzZm8cOluppaZLRYUDrIPrVm3Gfdre6MIxYSUZ9KallR7Bw==
X-Received: by 2002:adf:cd84:0:b0:33e:7f51:c2f8 with SMTP id
 q4-20020adfcd84000000b0033e7f51c2f8mr3599510wrj.36.1713654477259; 
 Sat, 20 Apr 2024 16:07:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a5d6383000000b00341b451a31asm7862874wru.36.2024.04.20.16.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 16:07:56 -0700 (PDT)
Message-ID: <ae9b190c-3961-4704-bc93-cb1c4182672b@linaro.org>
Date: Sun, 21 Apr 2024 00:07:55 +0100
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
 <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
X-Mailman-Approved-At: Mon, 22 Apr 2024 06:33:57 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 02/26] media: stb0899: Simplify check
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
> chip_id is an unsigned number, it can never be < 0
> 
> Fixes cocci check:
> drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
> index 2f4d8fb400cd..35634f9a8ab5 100644
> --- a/drivers/media/dvb-frontends/stb0899_drv.c
> +++ b/drivers/media/dvb-frontends/stb0899_drv.c
> @@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
>   	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
>   	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
>   	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
> -	if (! (chip_id > 0)) {
> +	if (!chip_id) {
>   		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
>   
>   		return -ENODEV;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
