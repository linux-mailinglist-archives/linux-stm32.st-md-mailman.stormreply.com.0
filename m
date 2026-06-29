Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /rJiFRNXQmo55AkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 13:29:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D36D9694
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 13:29:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=Ms2BaOrt;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=fPIguXn+;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1341C0693D;
	Mon, 29 Jun 2026 11:29:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2FF5C424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 11:29:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TB5GCB2728717
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 29 Jun 2026 11:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Dn94XK/gkhjzkpHhKvvDz8xdTIbBqtXbB1tLNjGugAw=; b=Ms2BaOrtjy68olMU
 9yzq/lDEX4r8PwDMooV7VA2KCYk48UdCtbvyeB/qVKf5W+nEZgqMZNZD7CdKlO8b
 qI/VIpchRv4Sxz0fsfb0YfpiS9vCosefN3p2bHk1aUvDct9EJhpJlDSGq1BNAzUq
 U4WLMagIK+rnXuBHVddkLTjhcpVoWB4W5kGQBT/yivJQvZw2Ca1xfB6yINtMjEaS
 UBxLkG3j7dCu9hMR2K5gUfPpXjnJmfXAO4p/Qb2u3Zg5dyiv6cqhKPwmbjmsVmP8
 05IDLn9ATb8wFW3rxnCspX6gxrLvFLxhS+Rh/aZqS3FJ8q7DNACY51ZwMRvR1d7o
 URGHRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha82k6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 11:29:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e53b8a302so118780285a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 04:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782732559; x=1783337359;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dn94XK/gkhjzkpHhKvvDz8xdTIbBqtXbB1tLNjGugAw=;
 b=fPIguXn+8yddCsdM1cc/r/LzxLP1TKTln4+iH3UGBScgepoAjIrc0hp1M4pVHG7mrT
 twEPFGarcxLoqp2VvZqqxtnntF/jvEqx6KZGLzBigl3/02A3qjgFnHvWuzruaFK+BwuF
 Wx7X4cI1S4snn1lKu/FoBbFemTIK/M11fHfgpKJsiStoSBcUYTfhm/mGd6dsYEg1qOE/
 yKbvEaRl4nkpOltDcxyX6lN4xUE2t6Jj5OfyWv5mYnAMBdNVwssjvR3UddqjykMfgkAf
 q0JsUC12A8aVx06rMIl4eRm2k7A20FQIX4CZ+advoIAMoaljTWdPgpOgsayvMA4/5rRH
 mKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782732559; x=1783337359;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Dn94XK/gkhjzkpHhKvvDz8xdTIbBqtXbB1tLNjGugAw=;
 b=Nth2pv7at8gcSL3IdtCF8n38Z7BivIGL8/v6qneHgyFhiEUSHHqKu6V2Pq9KmcM4Ox
 rLgkscg/G6G6huOOutJsOe+fmmSlljSpeyf0zG6wwth87UrPNoTUam/OETxVIusJ5MN+
 pdZRYj+03Uwc/abtlrDUYt6VyvJmoRriv+XcKdMKmqHVDuTyD4Z8tWHmK0h22F/2zh/u
 JZ6XXsKxar1Ss2E66zqpdkx/PhzSTVz7J56E+CTCbsErOs6P4AFpQB5dHyoe4vhbpazq
 MuJXye6//n9PspxMnwLuIpUS6P0qOn3LhwoVVjEhOOn0Nmy/yH/gn3RnkEu8CWlf4B+3
 6QPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+29CxvHmT7O9RcdJEACdeZm9UakcCv0rjSlFjq8UOG4LxZFeQJIOg0KT1GitoczHVLpAOEGXVpSUeulw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbIIUwIGR18jnl/yP0TPFhq0O8HatMo56cPNU6FHpQIEHz74ev
 SHC63DhQdbZim8p2X88SACVeEtkuw57fc3irn1vWRwwoWTlWD7WP+U/OWsqNYGT9kB8YR5mW2q0
 BmpjKhEKM1Dx3ucKjWWaApUkNxvSXOGjVn4vz4Sd11rmg2jYHKn3ANB769hfexY29i0jNq3gvh4
 f0VGyvj1w=
X-Gm-Gg: AfdE7clu21p8r3N0f2LtmIhTxo10svk+YjXQdDOZjzlbskbukAdZOX0dXfi5jbmjbgh
 TFvnW+k+TAfjJ6ab+5n0/UCMsPKTQKwqzCqI0PSW4q4R4naFln2VIOoGDz7SHGX9pDcl/sxt2FM
 r8ziW6VlE90jSlueNFSsC7OLWx2zcV2knhYW8scbaoqfq2iScP99rKaVclOiOj0t7spGftQYdHJ
 uwpmURABeykIVBybr/kVjPq0r8bXYcyfMrpmeSMjAtpVXpVEKEpFrjPFuqATsNbmrrf+xE3iQHL
 xx0/pyr+4ZdCzF1MKvXwLgWnDmaS8Awymfu/5uWqyaIQ7VVgD7k3WIE460W1MTgDXFjBcUiAZNb
 vjMK22twRXpcjP/FIXnxCj+QjRnOpxl7raGK64bZ6
X-Received: by 2002:a05:620a:4056:b0:915:8f76:8005 with SMTP id
 af79cd13be357-9293cadf811mr2614012085a.47.1782732558505; 
 Mon, 29 Jun 2026 04:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4056:b0:915:8f76:8005 with SMTP id
 af79cd13be357-9293cadf811mr2614004385a.47.1782732557882; 
 Mon, 29 Jun 2026 04:29:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 04:29:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:48 +0200
MIME-Version: 1.0
Message-Id: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
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
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6713;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WJjrPTVJEHMSIv6hVMo9hI0jASipWSJTfNP46iEy4PE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlb+g2w9Y9bz3nnFuqU3U87XMNnUPjRO5CRNW
 CsioPTs5WiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJW/gAKCRAFnS7L/zaE
 w2VzD/9KzrrA2R5Gsx+IYq48eCMrXk2oU6WPyOrCaaNDh9wDXUSCqq0kRbyG0bnzoDziRnrLqmu
 iHuDsOBS/mSwfy97bnk5OwxqiU34NmnDB26nHA6RZuDthlVPSt+ceQ4mCkZWA94QqY2x5Lisd/y
 UAiz737p9FXjK109dSf/f0r6WMOPMVMVhgOi7wD1ioQ0VeYMfSg+4Bv1ReJOX9qE6xtRPXpgXiZ
 8Amfc8vt6kb200UKU33ypDHLvCyMHBYb4WEZAiiqeFOmjtg0aAeLISOjIAzclnRYXpvIFdB93oN
 xDW3vDh9xVkoQA3kS0+mVOw9m4aBRYTNGSKX6aRn4kJIDS4w1YmNH5RT0Y+mPXdvp9WDP9g9yu/
 8g0KBPLOGrJPr6OXdOvSH+SthKxgnLjDmPQ6Xp7QmaaYE/tlkgWuaDEGUsIEbKtUE8VsKMp8QKN
 wMcYWmay3EQD96ue5Ysdw/p/wycaej37PrQjiBnxLYnrhObjWtrKj8h1FBn+Z/H/UwLut7O73o6
 GgaztSVgp3mr/1zLuKi6VHMFdxQ1PjiTcAR5/g3UgO8tpro/mGcpoRwRLBrYIYNlNgh+u6LdTOk
 R/NoTzr/QTkTnKop9WSYNVScVySdl6G/+pPDdJjyvSjqSLqwPTTl6SpLY5gJzGBOtzizTRh0Rku
 U4xAY6/UIUgV0TQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5zgwuAdLuzdTp9KPFKfXrwfSKnX2LHXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX+QJ4+sNIhXtw
 5lteZlbb+QUyw1/VB+ldOx3X9oS4E6qeoCCIPdr7T/8WhAp8O+aNYDqCHi+gxOhPdkh4eHPExDB
 riVTThdbteMjSrePmrL6UcJfg6sBZCp6XxDYzzY8CWzDUYaW2110zXGeJgYjpXZJwAXOhiuN59t
 z4ySQmI6oTwkpx89kmvd2HnyAjsS9d7evIZvbRXHO01xROANIeuD9MlBf8Fnc9oh95yFSy5BD7K
 TgL/iiUlCILLAXZg0vXruCbLtLZ6hsWa2gGta/ACIsbpj7YvElvGiLVlIwaKDlLLpilMY5WcK/S
 4vDrC1Cty1a+xFFlx5HLDgUIs9o5PehnRURNZc+nRZJnotX6NyyWF7YaIsUGaSZhBJtpJKz4Rs1
 JYI9XyNs+nemHChI9TCbOTpfcTQigZsKIgNcSKODKVS2UUgoXpjsfC70YUfb4G01F+FNbjp625j
 9q1kHze0IHQneYS3Ujg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX6IXtf9qbLbfM
 6EthN6rr5S+kdIoIyUvrHjHVxHcAqH2N0ywGTPQ/7krdiamLaO0hV5ROEsG+ZVP7ZcFevYgxjQO
 p4yOOpweAQvDCDoEPVCBA/UfYcH4ne4=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a425710 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3JCFraiX-5spO6125rwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5zgwuAdLuzdTp9KPFKfXrwfSKnX2LHXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v11 2/7] phy: qcom: add the SGMII
 SerDes PHY driver for SCMI systems
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
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:
 linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 203D36D9694

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  10 ++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 161 +++++++++++++++++++++++++
 3 files changed, 172 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa9f08749e1bc686e15cc5eb341c28..bd7d3fe411d7f3ea333e9e32e54f926a3bdead01 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -232,3 +232,13 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select PM_GENERIC_DOMAINS
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b71a6a0bed3f1489b1d07664ecd728f1db145986..032e582f2e1af96687484ce28aaba0c2ef73e754 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..8ee62189556fe4ff0d8aa2f8b105175e08000b7c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/delay.h>
+#include <linux/ethtool.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+struct qcom_dwmac_sgmii_phy_scmi {
+	unsigned int perf_state;
+};
+
+static int qcom_dwmac_sgmii_phy_scmi_power_on(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = dev_pm_genpd_set_performance_state(dev, priv->perf_state);
+	if (ret) {
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_power_off(struct phy *phy)
+{
+	struct device *dev = phy->dev.parent;
+
+	dev_pm_genpd_set_performance_state(dev, 0);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	priv->perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
+			   SPEED_2500 : SPEED_1000;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.power_on	= qcom_dwmac_sgmii_phy_scmi_power_on,
+	.power_off	= qcom_dwmac_sgmii_phy_scmi_power_off,
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_runtime_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_disable(dev);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->perf_state = SPEED_1000;
+
+	/*
+	 * Enable runtime PM on the provider before creating the PHY so that the
+	 * PHY core enables runtime PM on the PHY device too. The single SCMI
+	 * power domain has already been attached to this device by the driver
+	 * core, so runtime PM votes propagate to firmware through the genpd
+	 * device link. No register or clock access is done here - firmware owns
+	 * the SerDes.
+	 */
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_runtime_disable, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
