Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0sPwI7arS2ofYQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:20:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F37112DD
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:20:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=fOxq+7SI;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=IuWGqzTF;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EC97C8F27F;
	Mon,  6 Jul 2026 13:20:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B62FC8F294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:20:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxFxh391218
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 6 Jul 2026 13:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=fOxq+7SIXv5TAgp+
 3LhNERn5LTVoVpsJSWbou+OhJo7ZPhM68du15CUsbeYhDP1hDtmE5fsEssdy7A4A
 LQdOp9g7rc1wqNg6bAwqx6XeV1bISNfWRVcPN+cn0G7KI4hh+iln1RcWr74AOYBX
 vpTWpBfMRXMYiG/OmstFA4Iiu5+3JA8SF32Mzad2tcatFqPmB+ySf+Lvc06tWzUh
 9Eu/+yeFDSBSpQDc/c4MyGQVcoRu+aFF9mAZiSeT4LSd8AjA9VdnJ0BR8RZQcKyp
 +a842pp2cuRnyHbSrT+RfzGrotV/cUhyXVsRgnTVIlzDHeZTUsqTi8CKa+Wh9NxP
 ZTiSrg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrwph-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 13:20:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-59d595bfd94so1054980e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783344051; x=1783948851;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
 b=IuWGqzTFKEUX72DTQkxD50/JpU181uR7L4VZpD+i7EEtmIcg2t5VPbWanFyYHOhMMR
 ioVCquLpOtWtgcO835bA43y3P+hBeQ35GCSLaDTQv/0xoDJ73wWuEFldFe9SEIFzUWPb
 Ck908GTaKLXMy1tYO8jToaukniNL2O0OhUhVaOlUB8hpFx8z+VUKgja3UBe8kyi4SfYc
 +GV4ln5pSsJJKEF+eGVLXITT4E2zuzrhC4heqNfsCntHxqHImVbkX6rWHYy25F3ZI3JK
 StsG6ZxFoXd/bF8YVtT4xqb9RuKkHzNXUrTqZadIB42a82d8vW2fuzzj8JDqxw8THJrg
 xheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344051; x=1783948851;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
 b=QKB6lmMFfozjBBAZ7flGS9ETlEgbIt4oFMbv7fcTm7doZB6V9lPmPeI2tr/wPn7jIw
 BcPtNnYw0mTEuf74CcFCqvBNjRTzaWH0/wnrwbrQfdEvlmu2cY9XIc1Ieshzeau0f6uJ
 RMvc7KjqIRaooULAedo/cH8vr4XAIKI9PaJzcnduesX2Z71E3VgXsz0Ji2pkHm5K0Nc5
 2VrxorNQ1nWeGy1dOfTCsQEXSHcVkoWYKLND6TQpBI6Q/xU2WsBqT3Q498YSrdkaeeoT
 4anIQyG2NMcAZ/47w9oYvpUJPqLsQfp2A4UZ7yxCcY84gkKe+FTAZ2uNaZbggl4NSfQz
 I+hw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq0Wg8d2rW+pSALzl24B3hxNIY2qlb3HSA4hf2QgLTSt0Q+2Cpacg1VsfLhW2V+N6EO1U0ZcB8krzCjcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzBHU/GFsdDkGZZoJbgMimy41L4q7VPXR6PqRF0p1+QBd3GxDz
 QAoXCdF/98WGZtfLtjzOgG1WU4HrXBvPMYEoI0txmv7m0IAvfXOp8i+nodpcdX3F9OsVG6YhsQB
 6wZ2BvohaGahPEjl6+HZGJ7E8NdM+PoQUFsDUxBPMQfJ9vyMEG9B8JuTA12neKjJ9Gx+YNgb+jU
 LWypHF/do=
X-Gm-Gg: AfdE7ckTe8uiBxaHKgSYTIGiN1qIgfDp7Qv3oZYnCUSu5kRAZvXmOLSZIkj2z0ir1MU
 Mk5PjX8Odt5wPyd+VFGk7RfiBrH0pZgVyylwP6QYCm1Kw8WkOwawHiaxKJU1Ohr1rbfsJocot47
 RabHDOD2WoQw0x31k/g9ycV/17CSzFHm507xLETl2W8Irt0sKPUngvMf6LYuHss/sHThs1zZ2KH
 +fhm1yakpXlILAoatWHUHvs9JoTthe53/JQkSFylKhKa8EBivAq34C5U2dfmmj5Gbh4rMjotC37
 0ZM9vIX+HZeB87UFFStC+ixleoZMZlW3FUTM+qOpUOyarMWJgVHpW/rb/PyUSQbWiNLIN8qqojZ
 4xe3tmQKzB5Kbq+brBLF+jLedVzRXaJAxwanZ+ffa
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id
 71dfb90a1353d-5be907a7dd5mr258002e0c.8.1783344050552; 
 Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id
 71dfb90a1353d-5be907a7dd5mr257980e0c.8.1783344050114; 
 Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 06:20:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:19 +0200
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uetN8tQ35/MLf6WrNwnnyMDIulOdtwR7ChU
 fVGHHk3r0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurngAKCRAFnS7L/zaE
 w8OHEACRZI6ADieQbUC6leO3XRgj+gxRGg9lhMPexr8/DmUnblo/bE9rhFIw9azo7F31pSedXgU
 S2ZoMQph7d2IdVgsEFK68vmpeM7kbfHOmOspoTr9OTFAFVAYFLbvrdnvg31npbXMuipX44t9wMC
 z0+KpQSH7EuJRWn/0SdKx0hpl2F0NLAZBBYm/mOkxDC6oQ98L9KSVeAiZMTA2QN2e7RN3b8i5Y8
 +Tb/X2ZVbZ8KzjhAlymhR0hTk9QVAqHuFn+v0A4lMylebluozCzeMmS0lnaJoUAtkKBVoSGEZWp
 f7eVuChzu8R/i7CFuQ1d1uEjd4nCrXvk9N59kEJBCfVqIMUpcEzqt5Ud3i+1EvxEdD/9I6kTWIP
 Y1lgCr4T+O1AWH+b73x4EX8ls/BOq9lu0fO7MKzfbtfBIooYGgt9QUdToMMAQo4UTIIi/ceTYVu
 v72RM+zndt/2RWOsztsZXIsL3al5/9bCuw6E5b/HCWspMa0wbY00BI4wjanae9j4xJOKn5rLcx6
 kIEAGq+V0wVSxA//bEl3l+PDVS4jmieG559Qag5yL91dx6yD2+rHPj2gZCqzne+G1SYGWadfHDF
 676mCUJMBbrWaoAvNa6yFRi/PFlYGtxv+3Y/FSRc92uis4NqvNkI1J7u6XwuXAnF0UEbshJlPNV
 Cr51n3bq9Qj1y7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: RPn5aNSqMju3SFPCW8cljYX532OGOtgx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX6fMACrIxQ3jp
 HcMVEmeQic/OXK0U3dTKOKfI2vC9yiaZHsqttlkaWCbGTBhd43jmhOc0O51k/rk4ulk6ZeGs1SF
 SNs89tkLyWex0/TDws/8OO7qpmWDEV9qEL0jashE/OuiSDLFG5HeYiT+cdoVF4eppIVXcw0t0OG
 sYof0JSA/zyMIAm17jLC8pZYA0Pp3GKYr+E4GrC4IEyTMmRzSziqsKWBHDv5WV6Gl4WzXa+foym
 wob2LXCBsSoE9x7ZZ6cd3cLub/4zdNW0wLDYZUGQ+KZm7R/bn8pC/dm0sn2MdHKtyBGSJzFQPhG
 4wfnvo6J1vcaAWskQp3DCIdKhToouzqIP0SrnRYBJorr05xcCP7eCqzNDzh/RVDBIJv5gUitxD9
 vURnaVj5akwaBiW64VfA0HxfMKEMZUERnfYjTQyKRcUeJDCYVLNMNi8jWzyKNzedpuF16vYA4+S
 XIuI/WIDTBFBKKjH8fw==
X-Proofpoint-ORIG-GUID: RPn5aNSqMju3SFPCW8cljYX532OGOtgx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX+sSA9zTsdYJ0
 lsNSp1aG8SFDW+FywPcb/UFdzzHoHafMEhiW1+Hbn9W8BtOQR1jTUtp8vU11k6qfz4aHngSvEb5
 655grlI+pk/bkrMJ2yr3ewlVLeX758M=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4babb3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060136
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v12 4/7] net: stmmac: qcom-ethqos:
 set serdes mode before powerup
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
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:
 linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 529F37112DD

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
