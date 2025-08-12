Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBEBB22285
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 11:14:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE652C3087A;
	Tue, 12 Aug 2025 09:14:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FF1DC32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 09:14:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5XP6w005212
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 12 Aug 2025 09:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=; b=IhtfSRQ2YMp3r9Qb
 QTBakXU39kXnh3NAEBJK+jxPUhNti+qh2TnSA3O6FuXxZMFWJ92mtfpgaYuzpKlM
 79O6emmm+ijVk/GZsDz+7Y0utYD8xhI/HE1GcmNUUDbYPwtTK/pqvfAvkX1MCHXt
 zLgnT0FMJcu8wg830X801jUiQpgV5Zh9XqCh+ADbELn2FnOS9gICrZzQd5ELXDqc
 JMuHjW+zNFuPoGB+sR9PNb5guLJaT/oSku8iZRr5nqLYWea9Y4dIfvAon+7aBHnw
 WWDckRpDvB5IABisZYJyWOoePRF2XmOtgsNh7HDAjsCYrKKntzAOspkZicbfU5RC
 7W6NDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5qqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 09:14:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7092a001573so18114286d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 02:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754990044; x=1755594844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=;
 b=sAeGCLGTNxPlaKzgJ+jWCK7ed7lHn2XtbvtdncRWt7ba847ZOFv/joITPj03OeCD50
 ZwoSzaLZuHJU4bZPzmc2tayjDbATPHAGPWnHQDQEv0n3xgS1w0rU+XSy1QTxg2nDVpge
 yfL4/gQ9Xmas7I7JjT1/9EmA4VU0Oy8b5ekBUYWIVUVp/04c1tdIigwO3+ATq5xm8BBv
 GRwmdw8Ge5rrQaLH3bumJtK7tabhD6himjkl5K8qeNU8eaXVTgPlbmdxTabnJdmzSKUc
 aGRmeRf2A9YXHXRq5M3SDHQ/tcxzuRRHVk1bTuJK/PAlcQQQfPnp01YtwwejwK573qm+
 /+zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9UGr5JtsA782QDX31x8qv2GxgCgoJYvtW3b+zp6KsRj46/wlOe5aFzvDUNwXgyzAj8DWh/xBzcuVmcQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXZ15kRAeMG9Tz4io4x9IDucxbNhkX7+PYS5jakhctWUzn7i68
 xtz/Oc1a0lT7dzmCm9olhbK3AcnKazitzdnveyrQSsLR/FJqH5pvztlEqXpWsCen21GDJ3r20ux
 uCSl2CwysKlHUlCFUceiw+T8f5W7Nb9U63DuHQJdDXmQfLnbgDe31EExuwqw3oTWPMnaMXuA9vX
 CuVB0llYo=
X-Gm-Gg: ASbGncvawcQnMtk0577XxygSxXbMHxB73xalZKeGIQWMSD4gHon2A4aKcuHF1VmoZ77
 yZ9nR/i3Of8JJSzwsE88mEjBUHfzoLNEldfYYaOWPs47Dq5LDG8sT/dF2v9oHNcte8oQ4wCnCDy
 s257DwLtTGmOCu3hhyPWuNCTIURKd2+EKi/FbKqlunAbvedDV0Kip3C2rQ870KxPZ96pHz2X+ea
 q1XOquoKRBhg64Rl/McwaUjoeWgWl8Mqy0hHBhUlHYMkDB+etqCHwyHXUh+NSK9is+U/kO8sm5H
 mXCTbvWO1uIC2NAHDU/FTdW0g6c6moCZzr0SqivkqgDQGnwIdK75q+Yev+gghwmffd2eHL9wD9S
 SH14tLfKD+AVWvpRprQ==
X-Received: by 2002:a05:620a:462b:b0:7e6:3c48:408e with SMTP id
 af79cd13be357-7e860096e15mr26707685a.0.1754990044126; 
 Tue, 12 Aug 2025 02:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPCXaPbFG7yAsR8pzw0t16fLvywO1iDk8kuIeOO1bInlVQuLKav0rw2YYkObsTH0QGuYx8w==
X-Received: by 2002:a05:620a:462b:b0:7e6:3c48:408e with SMTP id
 af79cd13be357-7e860096e15mr26705885a.0.1754990043559; 
 Tue, 12 Aug 2025 02:14:03 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a1251sm2177380166b.30.2025.08.12.02.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 02:14:02 -0700 (PDT)
Message-ID: <90f4eaaf-2513-4479-8647-b855a72e0e65@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,
 Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Andrea della Porta
 <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alex Helms <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX+OuEx5t0wvyy
 Gc3vPQehgOg9HYwXNoVLdYGy9U86hDVuXO4DeeqwTun8jbNu/9TU7gSuM3GlNLq3mh6KTykqxc6
 Lv22jhEGfyhUf5Pl9YojLBZ2zSmwnUBIJTgPkdAwurARozpQmolDRHkO4zNQwpMOjmFpjhtMp4n
 UrvvxQ7JyDNpJqEcaomQfy9uJS8ePVR6JsP10Niwy0Ln8NB8/rl6rxbTfmXH0/gXb9Io6qTZDnN
 OHHcwYQeNma0MvX5J/32f0BY91iBiPqHRdh/mL4gSsAEq8CadxEi4rwczLsjPWLUyaa96iZ2i5g
 ZFxAkhvXvK3iBVCCDmDHqSsnAAdxzHWmjOBOqlHvKZFoPdI2s/voX8i67wJ3As98KKs4DB7L3FX
 /iUnEPP4
X-Proofpoint-GUID: x2RdHYA2wVYc2CKv-d1pib3J850j6VpN
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b05dd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=42SW9st40EnfI9Ma3XoA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: x2RdHYA2wVYc2CKv-d1pib3J850j6VpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
Cc: imx@lists.linux.dev, soc@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 arm-scmi@vger.kernel.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-actions@lists.infradead.org,
 asahi@lists.linux.dev, sophgo@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 090/114] clk: qcom: alpha-pll: convert
 from round_rate() to determine_rate()
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

On 8/11/25 5:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that prior to running the Coccinelle,
> clk_alpha_pll_postdiv_round_ro_rate() was renamed to
> clk_alpha_pll_postdiv_ro_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

[...]

> +	req->rate = DIV_ROUND_UP_ULL((u64) req->best_parent_rate, div);

space after typecast is 'eeeh'

but the rest looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
