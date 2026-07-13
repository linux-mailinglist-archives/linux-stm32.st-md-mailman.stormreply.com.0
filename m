Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P1g4BWLmVGoUgwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14174B7F0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=LglMfE3i;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=H2ornyW1;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B61D9C8F274;
	Mon, 13 Jul 2026 13:21:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33599C7A83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCE3Qm1561381
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=; b=LglMfE3iuaXTOvC+
 Glk4qRQYP1S5h9C9BHTI8RQ5NJdjMZyMlsQsl5fbGN9kik4i7RA6B+kaxzVWS/MB
 AQ2J7J9DdIO8JCI1nDryAb8EyOQVoXHM/Gj/e3SfGjITUXUKhiiGqt+mvjpjEr5u
 Qtj5cWXSLd+AEl2d3ttJR3sh8V6bl+t0FWOUS4pVtm5zBFlaXd91t/H7WGorLh1Q
 xFp7XV18n+LvRnwDND0XpCMXYqLQvtYTEBLi66TqPSoB/JWUvFdxsXMu2LhjX3fl
 bBeT3r+MDRz95I8moyRXQ+uTEWUQMT/TAkSPos5ZuZb9lbQOJfRhS2UO7qLKesAy
 4YslnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3apd1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c21c01cf3so62253511cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783948893; x=1784553693;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=;
 b=H2ornyW1Dz9n70j2FVrzjWS6hBVQNXhqbzeiEfe0TsQAAUgBmzsEyVE0SEy2vHGfNt
 zsEPifN8CTcltmjF9AIzpnHgES9C3Okp92/YaW/cvJ/azk5t4uodddvpELsVYAyyJpr3
 cyX3KI+cDuAlsMOrJ4ymGDHY1doA+JwxDo8PxTiLY/kXG28SWwEU0WunIAINfZnuIg7G
 toHJ44CnX3IlJ0khMmMRO24WQSQHRzQ0MXFDcxgbhdFAhwXQU+n5xpTOdQ5IfAcxoa6e
 f1GBvu2ojjlswVepuv11GjQSptsdQcTHRyG4rE8djxURzo4sFkY00OjI5vSmBZSbj9EM
 ylOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783948893; x=1784553693;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=;
 b=jrOnaGWzVufQ5zTr3CDGx9MuwWa7bF26UQUknhtwTh9a6yxh5rEXCaz2cFSoywQRYz
 4Xah1ULEZK38VHZnuICRUXDjDsXzTaCCcFv+jGx4WITaD3AQHHsp7Lz/qPBtA8Obqo+7
 v/UXRROZFte/ttNYMIx4RvVgbmlRqlTB0xJSY2sYbrWuMV9AoEqI6+y/fTo+3De/v76b
 YzR9FpMJ/zTxsskhWdQ8NBH9uVPg+sG1PIUpB2cm3mBcW135gWmES8ed+uphAXjDNNUg
 FuacfT+/HOb2yKsxBKeYuFC3uTZ9jfLwqEUgpZvThf0LuBhHRlvz0sW/WN7wLPCO7aWq
 gA1Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoneA7NhPXRaQKQ3YBidSW01aw/fKCKZ0lZYDQiIaI/d+7bh6lfA5XOdQ64FDaCM+Z+fDfFhybtG1ezBw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGsS7wPai/LsJDUczA7SQscCXGlWji70BHoND/kI20sAsVjEtA
 sicgFZgAdYbeO24pRJlv3Rp0C+gi3FUf8I+D/jh/tylixVdl9J5WS7VscwLSID0r7IO3d5plk1z
 zA5K6flTpwx4r7KsRBStbLS+xLqNoFQJGNZCeS7HD4sY2VKEYFcx3cDK+PVzzYkcnuHqTJie63o
 6OwcqEkoY=
X-Gm-Gg: AfdE7cmA8ghsvJb003oWlixylyWMx+ePW4Z81rgBc+ehc2MzOKeAb2+kwp+2GFkbTvA
 2LKFKd8cP3t08iZJGsnrZogPy5aHVE6dKfX7e5Pev6Fpa4uyitiqtIV6xqTg9jAQnJqZkDBS+0G
 6Xz5EjuhM290J9pCtu0BvQcXkQ/F3BZzNulfjhGppQIdRv3jnd3kFy354mm9msx7OHIAlRrUO+i
 7/bzshkklnuQWCnHD/3SegAPh55CZvgk9w78Xe245cl6wOqU/4RVoziA/yZRYCIXzbnG2Cw1RCr
 nh65QWPKfuIWAb2aR1PNeKPvIWzBJMMzAHNjeu01nIQzvRHnWofNTBm1NxQz7W90k5ay5mLfSZS
 W393v+VJLBt76rAKHZ2EezssdhnhQjCUzz/uAbaHM
X-Received: by 2002:a05:622a:3cb:b0:51a:6feb:dc8f with SMTP id
 d75a77b69052e-51cbf0e0756mr87983441cf.9.1783948893534; 
 Mon, 13 Jul 2026 06:21:33 -0700 (PDT)
X-Received: by 2002:a05:622a:3cb:b0:51a:6feb:dc8f with SMTP id
 d75a77b69052e-51cbf0e0756mr87982631cf.9.1783948892921; 
 Mon, 13 Jul 2026 06:21:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:36 +0200
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-7-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SlOf+BhDICNYWid3SpsPo349aSqYaDdHZpfmoCBZZHw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY6LAQcF9quKJEcvEh90UXYXlVsW2Jh4yWPh
 RRmPDlSot2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOgAKCRAFnS7L/zaE
 w9aqD/955VoK6LaO6vaDxw6NTt3itus8v3c/OJJG0p98jDFCjD9YC2veyzrofOQ0TKWJWkmc/qq
 5L+Ac3xpoWqBjo9EjcMJwbHZA7YDaQ1QBEwbfrOIYjfwaQvPgRz543CB2Rirv7mpI1ME/ZYGarG
 Lc53Oo+GNT1knmktmT98TP8TPiwyfLnv6s2jgbfzHlQVdSxInzl6Xba6PrCJHuhMLDi43O/hvtI
 hkq2+mkJvQnUya9sbFoNnDO5XbMFOxMtggKVASqfi5yaDZVn7M8rRonjE1EbIVHWfa/toUesOa0
 P2e0vo0oOBPPSXJ3r+YZC31vRjm8PvCtAFda8qrWLHm10Na27nQ6aU+4dKx3LBtP6fXF1t/Sad5
 GVj+DwHrUg0PX0oR+JFTj8EmlXXKuaFe9+36xK4HX8ntTUknyXl/r3jEBsr+BP3e+vriuO1WGBN
 4gURGfViayyslZFJuqGaC3rGsj4SIfzqaN+4tboTUYzP7uHFYkFngFdmj/ItLNcy5oX2pCfSoIQ
 JoFgO/XoSylDbz5dTihBwgI4MureklGQDOz7Y1MVSeQl71Uo6PMERaIIUr/PlMJ2PFikXISCBbz
 B/8f1XlpUku81iFnZGKEliv4krJ2aF3MsOEoa7ov34PUKUoIyWfcroB/lyMGxpL2A5g4yFXqFEj
 krC1QUE24KD0tBA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX6f3ypcXyAq44
 JfxNyGZ93Ka1cTpNhbCleF8SrZ3me8PN7F4dbN7xPg8HQS+gnAatCXlcqytKnl0+8xsFBl/e5hQ
 g0nvUeiCL+K2UTcYRFP4jr+LWBdDZ8rSmZNAkmHoSBkRhWIeFjfh81Ls5cBTe/2SeBS0nnjdZae
 N1wgvaADWAEfJkCp5dY0EKmTsKAE0I45bh2bBxsIhLedTkwcz4lvkk58JhhqL2gZbOFN7oS8Flk
 II6+v0yLwcGcyw3OTlkYKzVuytSRSTvNimYu6ZGKe823XCJ89KZyR79gdnoO0oRuG44FST/BGmB
 Edz1gXqv3aWSAEFPRnMdmVFKgN8+9B7F9Eg1G/6HtReWjejzo6IMW0ozDjdYzvz9DS8K0mwSBHP
 uPhx86VlYFEfvSphc0htnKAxevGpFC1MWNTk/6yDdLQDlZjv3EKpzw6kT/mNw7ZIMZD/J5O/poC
 rUz4d9XbgglI7YSt2FQ==
X-Proofpoint-ORIG-GUID: OtmWwwVjKkjmmZPlouHjMbwqfLcruRqz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX3/QuFyypHqpb
 OTft4DYbdn5KFoBH016RikoMYOKIwg6HooD9bK1MeRWp5rJMhLSFPBKg83iqGBNcNfjfL9cGGXz
 UCq2WZSn32kXW5NMbqSdJ8Vgrr2Viik=
X-Proofpoint-GUID: OtmWwwVjKkjmmZPlouHjMbwqfLcruRqz
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e65e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PjAGQVefHaMtIuCO3vkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v13 07/10] net: stmmac: qcom-ethqos:
 fix SGMII loopback not set on resume after speed change
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:lin
 ux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB14174B7F0

The loopback in the MAC wrapper feeds the TX clock back into the RX path,
while the SerDes is being powered up. Without it, dwmac4_dma_reset()
polls a clock that never toggles and times out.

qcom_ethqos_set_sgmii_loopback() gates this on phy_mode being 2500BASEX.
mac_finish() now updates phy_mode to the runtime-resolved interface, any
subsequent resume with a 1G SGMII link skips the loopback setup and the
DMA reset hangs.

Extend the guard to include PHY_INTERFACE_MODE_SGMII.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9d19203ae4bd7dc17aca068f5eb88ff830e4e906..e083d7d55782ec8310e9375e466be00213667457 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -190,7 +190,8 @@ static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
 	if (!ethqos->needs_sgmii_loopback ||
-	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
+	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
+	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
 
 	rgmii_updatel(ethqos,

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
