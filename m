Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c3BcBqu7TGqBowEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 10:41:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0D71939B
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 10:41:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=jm0Kg9lS;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=d2N5NGTO;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2D49C8F264;
	Tue,  7 Jul 2026 08:41:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D711C7A835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 08:28:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66641Zbw3614039
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 6 Jul 2026 08:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=; b=jm0Kg9lSibJvV8Yi
 8hdJzAn4zgpP2byZ5O4vxPHA667bXVLXHofUt568kB49iHxnfwvFhctaInLtCjCZ
 sjNHRodxgeyEI+K4Sh5SeEFuH+eYubHtMfiWH/bAUEFyu7LxqpBoChobn1qyHVpZ
 1rLLI4FJJqj/Yk953HEONXVBT+N6ylBmW+SjTQeQEVhfTmxCK8O9BG8vaRt3Exir
 JXmS8JQhSMmJuTk8SMinF8d+mY+jVTVBRkY8NqkZa2/Ot0bSxasJBedLFZ9P4/jy
 oIqrv4PZJHfl9zhVgr7IHFht7qp40w3MPq61gyA4heu2IH0hVtB6bY7pBm7HdH1D
 jKj/ig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnbcf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 08:28:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8eac2620cb0so37352906d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783326501; x=1783931301;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
 b=d2N5NGTOvev3WQ+oUnHeMatk/VVV+tInfzueHQX4SIKa0GJLtRemi5W5F0Ha/ssnFx
 nxgzXGyI+oluwOfyuha0ov8glnUBeo+AhRaFv7EV1hLjnSiu8k5LS40rYzos88oBgwSI
 b1X2F6n0ExjoxTP++LFX3b18WX8awtN33qXct8z3U37eitQkjeFg0UJHNRRIXwz6nY70
 CEJ2zqZcK5j+O25oy9rsZIvvl5qr0d1QCXtHfa+BL51aaPUQw8LgV/GSNkMPP/BpHB8a
 bCPNC68OMX3+1cW5moH6ZcpaZxC5hIwry1GlW4tO3ciOYfXVGi9vmyeMszNeXubM9oec
 vMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783326501; x=1783931301;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
 b=f5yrpPCXw/cC7+x7vmxScQhOpCHxihLQirB38P4a2nuLWX9rimu1bBK5d3zIO11mQq
 k3VlxB/TXlnoBrYUx3mAYmP+hQUPYUwlsM7CNnlWOq07Atx88oKNUwAD9aB0+w2eeNCj
 1IzEbv+RDJGuWvZGpeMCYWvDcUzb8xx3nHPXRf4+GkJQ2Z6obMmK5nvdVhA2u2TW4eAR
 IuiOaO9c6L7i4L3/ga9Uqkt6lYdq/m9vsUMek7siuUF6p1s3O+ugouBa6bV/zF8w97oL
 i3JuE7rYAd2UDM8XAfzRVRAs3nS9XzjOpdv6cgyj5xMcIpa7ES/kayOxJG4OXZnQybXx
 9ckw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrkbbmVcwZCRNC7r9Zo2fc02TLULBsgQOLrD2lK0XZzKUZHcevA1sM+ayaTF8pAnMeJwX3TnzN5KVWtgA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNxywiPtfzMJmkvN2iWHO4C8woLOFAImVITudj3QZG3IDU2ROb
 4KMl+IDCLOpijNomvONhv6xyb03eOFHGyBShkB0aGKwsiC7Hxg15waNkOpUk7DknYFi6lQa8AEC
 fQXOCkGzh1R8N2TDAmQ9qgebtVCuKAivqx+0lkmKO0c8Wp2pVdz3tmSVJn190DeRlUxF7q+376G
 Jb+Ww3j3s=
X-Gm-Gg: AfdE7cmxydHtWAzDzgFT8zQG4IIz7D3Pbros0x8XOCsjzfRpqnOYNYeZlcfeQOyhu6p
 a4cBMv4Bsrs/iii5AUwrCSXopq48Eq1CJoLsIlTdxAdnQJQjE3oep0Cv3LPypcjOg7ikBiWU/6W
 bNtmMMxhKOs/EcCYF6Za0jsbFOcTPpfPrB6wo8317TjGXG1t1dEFVePNgUM962adEDHXISzLhml
 a07IGr7BVR/4kAr6GDi2bK89IBNupJUrcW6DbgbWFWfAILj50DKs3sgDrJ4/0izRlOZQSyPx74I
 Wwv3SruWY+PRp7pwEPUVC9W0HZNUly2Satz59naON9Jv6faK7f/h0yq41ytI3sNZRIhWyhmKE7J
 OtNBA5LS3ROto079z5Wm+NFYz5iZTgGqKgQ3zQfSKAFFhVzXhh7LZ1aNBzhlbMg==
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id
 af79cd13be357-92e9a4ed0e1mr1294191985a.62.1783326501617; 
 Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id
 af79cd13be357-92e9a4ed0e1mr1294189385a.62.1783326501174; 
 Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12b62907absm677939066b.33.2026.07.06.01.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
Message-ID: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Chen Wang <chen.wang@linux.dev>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aktWoIfY_DdO6gb4@monoceros>
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b6726 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8pif782wAAAA:8 a=IpJZQVW2AAAA:8 a=TiEZW8bMWLlPbLH3YMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: moNPfPaB3TO5bwchuxUw_1dqdSj_1-16
X-Proofpoint-GUID: moNPfPaB3TO5bwchuxUw_1dqdSj_1-16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX01VDYg9b/uEr
 rHPKb8ksKv+ceIX/FH5PGdMTDxSqLKif5N74Ut8XY1xZBkvmqGFk2CXPYaWcYt10EdBgwotO0/c
 /FA/LXviTuM3C3UTVraFHyK5IXC5b2BwUsv9JwpKKohpBGUJg3UhWqUQSVKXT2sM8CFCUpnx5kP
 UWJ67kasd+Bj8mZJO7LvMMI/BQgw9Amdz2hLjPtC1C69qfL50fx78TETv62LJKPVz+Ostiu7Fkq
 EyRUk9zq8+ZAIXXsxl61AjuA/9rrauRKJaq0MZX974yxCv1d9JAm6vVoZ0B/BGLaMI6F/WlWqPU
 ubrzhFG4LZfIUvpKUN4QzyLIaVcc2kGh+0xoeYH1MtCkOGCi+Uhg2FOEGSXzYf0J4Ml144KCfpN
 Wxfz6rHZn1WBJklKDqya4/eoJW9JmV3CcrYKJ7x9ihaAgvCVOtNvI1aCCdvl7Xwc1tGVB6lh8fY
 ttE30539p07sGPaEvcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXyZSS9Q93govN
 z6uZ6J+jMVCDLcQe3qmzI2fKIuvrkZWPDHBA4g0HhtZ0SOQuMpH2PDhb1jYOSf4kNhv+UTpkHc7
 rz/YNZhnRPtXH2ln9H/+qAUpg73l3yQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083
X-Mailman-Approved-At: Tue, 07 Jul 2026 08:41:09 +0000
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 Janne Grunau <j@jannau.net>, Michal Simek <michal.simek@amd.com>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Hammer Hsieh <hammerh0314@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Peter Griffin <peter.griffin@linaro.org>, linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 chrome-platform@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sven Peter <sven@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Samuel Holland <samuel.holland@sifive.com>, linux-renesas-soc@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>, asahi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Neal Gompa <neal@gompa.dev>, sophgo@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: Re: [Linux-stm32] [PATCH v1 4/5] pwm: Unify coding style of
	of_device_id arrays
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	DATE_IN_PAST(1.00)[24];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:chen.wang@linux.dev,m:sean.anderson@linux.dev,m:alexandre.belloni@bootlin.com,m:mwalle@kernel.org,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:paul@crapouillou.net,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:groeck@chromium.org,m:j@jannau.net,m:michal.simek@amd.com,m:festevam@gmail.com,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:hammerh0314@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:khilman@baylibre.com,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:piotr.wojtaszczyk@timesys.com,m:linux-pwm@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:chrome-pla
 tform@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:rjui@broadcom.com,m:s.hauer@pengutronix.de,m:vz@mleia.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:bleung@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:neil.armstrong@linaro.org,m:sbranden@broadcom.com,m:inochiama@gmail.com,m:nicolas.ferre@microchip.com,m:samuel.holland@sifive.com,m:linux-renesas-soc@vger.kernel.org,m:alchark@gmail.com,m:asahi@lists.linux.dev,m:kernel@pengutronix.de,m:zhang.lyra@gmail.com,m:pjw@kernel.org,m:neal@gompa.dev,m:sophgo@lists.linux.dev,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert@glider.be,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linux.dev,bootlin.com,kernel.org,sntech.de,glider.be,lists.linux.dev,nxp.com,tuxon.dev,crapouillou.net,gmail.com,samsung.com,chromium.org,jannau.net,amd.com,lists.infradead.org,vger.kernel.org,baylibre.com,broadcom.com,st-md-mailman.stormreply.com,linaro.org,timesys.com,googlemail.com,pengutronix.de,mleia.com,linux.alibaba.com,collabora.com,microchip.com,sifive.com,gompa.dev,mail.toshiba];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,wikipedia.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23C0D71939B
X-Spam: Yes

SGkgVXdlLAoKT24gNi83LzI2IDA5OjE5LCBVd2UgS2xlaW5lLUvDg8K2bmlnIChUaGUgQ2FwYWJs
ZSBIdWIpIHdyb3RlOgo+IEhlbGxvIENoZW4sCj4gCj4gT24gTW9uLCBKdWwgMDYsIDIwMjYgYXQg
MDg6MzM6NDdBTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBPbiA3LzUvMjAyNiAxMToxNCBQ
TSwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yikgd3JvdGU6Cj4+PiAgICAtIFVz
ZSBhIHNpbmdsZSBzcGFjZSBpbiBhIG9mX2RldmljZV9pZCBhcnJheSB0ZXJtaW5hdG9yOyBBIHNp
bmdsZSBzcGFjZQo+Pj4gICAgICBhZnRlciB0aGUgb3BlbmluZyB7IGFuZCBiZWZvcmUgdGhlIGNs
b3NpbmcgfSBpbiBub24tZW1wdHkKPj4+ICAgICAgaW5pdGlhbGl6ZXJzOwo+Pj4gICAgLSBObyBj
b21tYSBhZnRlciBhbiBhcnJheSB0ZXJtaW5hdG9yOwo+Pj4gICAgLSBBbHNvIG5vIHRyYWlsaW5n
IGNvbW1hIGFmdGVyIGEgbmFtZWQgaW5pdGlhbGl6ZXIgaWZmIHRoZQo+PiBpZmYgLT4gaWYKPiAK
PiBUaGlzIGlzIGFjdHVhbGx5IGludGVuZGVkLiBpZmYgPSAiaWYgYW5kIG9ubHkgaWYiLCBzZWUg
ZS5nLgo+IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0lmX2FuZF9vbmx5X2lmIC4KCkkg
YWdyZWUgdGhpcyBzY2llbnRpZmljIGlkaW9tYXRpYyBleHByZXNzaW9uIGlzIG5vdCB3ZWxsIGtu
b3duCmJ5IG5vbi1uYXRpdmUgRW5nbGlzaCBzcGVha2VycywgYW5kIHVzaW5nIHRoZSBleHBhbmRl
ZCBmb3JtIGlzCmp1c3Qgc2ltcGxlciB0byByZXZpZXcgKHRoaW5raW5nIGF0IG5vbi1uYXRpdmUg
RW5nbGlzaCBzcGVha2VyCnJlYWRpbmcgeW91ciBjb21taXQgaW4gdGhlIGZ1dHVyZSkuCgo+IAo+
Pj4gICAgICBjbG9zaW5nIH0gaXMgb24gdGhlIHNhbWUgbGluZTsKPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmln
QGJheWxpYnJlLmNvbT4KPj4KPj4gWy4uLi4uLl0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
