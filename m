Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oUIBHV7mVGoSgwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1693D74B7E6
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=LuHB2Lnd;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=Kqe2m9lh;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5C85C8F275;
	Mon, 13 Jul 2026 13:21:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F5D2C8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:32 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCDw9a1494397
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=LuHB2LndYAhekP/j
 qqI6yQ1IIvHllU+v/KZAuCsz8E37eSBJ/bOgI8R9w1HloRsQVR/lusbYFphVuRQM
 ncaLznaaOZ+jeHtIqKrsrzK5JCqgTsSRyhCO9cXFZgwr9o6k33sw7mmJQNrb8F7R
 EC4ky7JImgq3CLSrmd3sZh6HesP8U9IIKPPhXIVLimSmDCbIAaSlKexL3PW2Gt1C
 hNXMwOBmK4v7ZEV+ILuRuT4iStzoti5NGJ4uK+4650V8aLn42qktRa1uUbwOZImt
 XTpbLooToXh5GCa7hlWSVWrwLEgxHPy75kUR40ZOGYkjWYalZ4Im/4G8MWbtq+ES
 FVA8Ng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2qhd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0408254aso52842741cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783948890; x=1784553690;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
 b=Kqe2m9lhdCSuwapvZqYYmx70jGARnqR0uhvMNI737am/+/yRdF2Ir9qHwbG5mIMroV
 rEZwhPgNoPIJgU9lqKVffVqqSEDgpsOCN/T1GlbLyqaPXJpRiPCpesIi9qHRb/BzbnIi
 1T6YxUZ6gbpbLr5S6fU2iKRCrwL0B6GruAOnt86VsSkkyjdP0jiHFbqeWIiRbXGkhCgB
 H27ViNNlKdqu7iE2uoqA7PZfFbP5VNDlXZu0NoIs4vT/Z+XnVQgQ/hzAyUjzSijSJlqz
 ++MIXvwRZzLLVIC3UJbcnjNgWLABNBvZQmP2Jq/UaK5bvpTxCEpsZnLUw10i7gnHkRuo
 jOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783948890; x=1784553690;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
 b=P4WhIJcESZW76dWuvyHreYosWmDt4cyJU3ehzfy3f0RLL1LsvHSQgBPjHfjAAo4z7c
 8VqCXyK/bvTDPpoLsCq+aXMLu+6ot/fivgd/Q916Fd+KqcQqLHLWOQGX9EPH5fH3FcIg
 W74ihCsDQrSZxNZS7OxQeY+xH26VFTr8aLRZKr6GNheSoQhEy5v/D7p0kO9c+dutBzts
 0E1pkQNU2Fi8HtVRC4MnvSsdnM2LQzAfQfIbLlt6Enlui09WpSnue38rkCgoGCxiOikK
 AO2YZpd3nGKpMaW0zdYiLYE4RoHU3JU77sNT8xAPzrGRhjtXVrpcVo3Rxp790m2yZhob
 Ejag==
X-Forwarded-Encrypted: i=1;
 AHgh+RoArD1kLSwfsBubKMdwovZaZcnJot7Go2m1LipGV0wavAUMvbjUO5COe7YJ8IB1WF8izLYLxrkuYMo5oA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQNhFG23iWU1goG9udMO+ouwlyHXAb9YgEcuNuefQ84JExJnu4
 W0eVFviVq36vQ40H0uXiZpTShNlX00KgZ6stMA5bIQg2KuH4melKsQ3O6s7MhrXE4PsUMkKl6xK
 QOzbdBf2MLmrqUufr5wgZTXyzXcT+Oo67uER9bo+ccusj8GXpeMeMgy37z9yEpCbJYoGgG1EYu6
 uLluO1v6E=
X-Gm-Gg: AfdE7ckxLOT1fdMTnIG94vf1wZLrbKNAmfsMpBvRO7NCfV8A56YlSoV0KA0U4pow1uV
 IFXtJgBhw8Man8sN7BqsB46KUCOjgYt5Gx/zgF6IPrl9OoWIMMvdbWCaOTAOrIE2HeY6fe7WaI6
 I8oYtU3qmzJqUBdwvK/4dnBTQufAlAqbjlUs9dyMZoCGWMH91B6bx3Gwds9d8olkCzlOLt3nv/c
 K8ryVq6Eh3pFZu4joOYG7OBT/Jg7CmRcdKes+pWsZmESCu/J0vxrLPgMmaJlpAEuTNE5Jnn78W0
 Kbd5ek4nZEEOOgRePGf1CiXd1tO4FEhpglqgJONkCmviIeE8+tmQ0gWXbuc4kFXASMubacdJ0l2
 OtUWbkzkAh32dKylV7zjfV8NLD9kjXSSl4XOXcs2w
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id
 d75a77b69052e-51caa0bb46fmr141764031cf.19.1783948889475; 
 Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id
 d75a77b69052e-51caa0bb46fmr141763741cf.19.1783948889084; 
 Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:35 +0200
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NA70xnk/UNTcZEimYYDwGN/0JGIaZCh/H15cO1NUAsU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY5/+vs2/qf6ixq4/oND2Zx6UG66WUho2k1N
 BESE3IZZ9yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOQAKCRAFnS7L/zaE
 w287D/9ZdNDg6JWXdurG/2dzivQeLaVo/7EtsCSyerxef3uIlCFZXmkGtM9e5iwQwgajmvVUCn3
 JTuk3xBjg+Z1rKC1kB/R3MjBD8PhEW+E+xtyv0ZfJ0dLazOINtSW3GAlW8X8jCLTZTcdvwEFdzY
 KIC9IY/wiiZ8QSRR+AhHjb5oF9P7v6JqeoqmJjeOZtJfRdnWMv3WpoIwpkP7GEtoICT4ADSsMVw
 dZ7DKd/klrXJmNHOgxtCE3Sa/tiWHW37EyzPjzFDFIJcWktXMWkFucKsCab66xmA8dxOPc8oZCa
 J1xm+gim/rKwzek+BM1739EJ5i9AauUDha1WT5QrTL9P5+3SvZ4zNLwhomOEKkLoZghbp6Pbepc
 XYhKBRQQM4vu1cZJi7F5bb9E4ACR+buWVjXcCeDZANXlHHtlPmOHekz+wJ3Ua1YStpgBkEAzKk2
 dFiek2jbRDX7KFBUTDPBTBIRkqzc+Y7sXl/CwPYbMw8Afeddl8kY4dpRvzG29iFvQmjSVwHcAbe
 Lgkz6aIJy20PcDerwJKefrtBj6Uri6D3O1qhz/Z+7KvVbnD2CZq6zoC940lmSPJUt47jeAh1VDn
 Uu5E/R4SosFE1DGpvef7KgKjGkKrEm7yAWoep/YaYStb2OwTec/khkzbk+W6+0EYIeUbC+syBv2
 3gGFk01Yg1NAiWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 6uttXWm-XiWmBfzZAOl9VOgmy7H28Vcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX1YQsD83AihtW
 zrCEsyUmvjiEttMkoilYf07SJDtpT0PdqrOSUBdvuA9VNNX9c74qdQwLY2Kmv9fkwngrDNVguKx
 gvQKcACFr6Gqr4S+mSpp2ZOCtYsb7H2VhmvR2B8rB3L+C+NTK1EUBQeUEVTvpR2pr++W5ButzLC
 zxiz4ZoDPHnrmP3Twv7ZNfN/+tXSC9ODuYvJJLLl6q2QGryLGgHn8xwC1QPxx5unnLbFGAxsteL
 enSrj+7fNQPUv8ETO2THwp9GjwHqaWkRo/YXXL0HOhs+qDM4As3C/9lnflXAmPcnwAuKP8YZud+
 i2AHXE1wtqX17Tir47sT6K8Pof0SICS4KAJLs/IQKnc5g/gFkwKTrOoooSe+ZrmEvg/6K2yr5RG
 dJarXyBlwP4FhsgLXNN9KF0SC3ZaHE9eP/5eJuPOyWZsXkjZJF2eCz36RbP0uMB05fZBydy3aEQ
 Xc1YyFJm7VDTp5dRNwg==
X-Proofpoint-GUID: 6uttXWm-XiWmBfzZAOl9VOgmy7H28Vcx
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54e65a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX5atMB3atWxco
 Sfwt6YZXVcXwzuKaXeDrucrUzv//WEIiAVunGWkuVomkapOZlCuTsk2iicJpMeLw0wejzAKVJWB
 mRsLRqOnT9JMa54ltMen/EZ8Ch2c2LU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos:
 update phy_mode to the resolved interface in mac_finish()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:lin
 ux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1693D74B7E6

ZXRocW9zLT5waHlfbW9kZSBpcyByZWFkIGJ5IHNlcmRlc19wb3dlcnVwKCkgYW5kCnFjb21fZXRo
cW9zX3NldF9zZ21paV9sb29wYmFjaygpIHRvIGNvbmZpZ3VyZSB0aGUgU2VyRGVzIGFuZCBpdHMK
d3JhcHBlciBmb3IgdGhlIGNvcnJlY3QgaW50ZXJmYWNlLiBJdCBpcyBzZXQgb25jZSBhdCBwcm9i
ZSBmcm9tIHRoZSBEVApwaHktbW9kZSBwcm9wZXJ0eSBhbmQgbmV2ZXIgdXBkYXRlZC4KCnBoeWxp
bmsgcmVzb2x2ZXMgdGhlIGFjdHVhbCBydW50aW1lIGludGVyZmFjZSBhbmQgcGFzc2VzIGl0IHRv
IHRoZQptYWNfZmluaXNoKCkgY2FsbGJhY2suIE9uIHBsYXRmb3JtcyB0aGF0IG9ubHkgZXZlciBv
cGVyYXRlIGF0IG9uZSBzcGVlZAp0aGVzZSB0d28gdmFsdWVzIGFyZSBhbHdheXMgdGhlIHNhbWUs
IGJ1dCB3aGVuIHRoZSBpbnRlcmZhY2UgY2hhbmdlcwphdCBydW50aW1lIC0gZm9yIGV4YW1wbGUg
c3dpdGNoaW5nIGJldHdlZW4gU0dNSUkgYW5kIDI1MDBCQVNFLVgg4oCUIHRoZQpzdG9yZWQgdmFs
dWUgYmVjb21lcyBzdGFsZS4gVGhlIG5leHQgc2VyZGVzX3Bvd2VydXAoKSBjYWxsLCBvbgphIHN1
YnNlcXVlbnQgbGluayBjeWNsZSwgdGhlbiByZWluaXRpYWxpc2VzIHRoZSBTZXJEZXMgdG8gdGhl
IHdyb25nIG1vZGUuCgpVcGRhdGUgZXRocW9zLT5waHlfbW9kZSBmcm9tIHRoZSBpbnRlcmZhY2Ug
YXJndW1lbnQgaW4KZXRocW9zX21hY19maW5pc2hfc2VyZGVzKCkgc28gdGhhdCBpdCBhbHdheXMg
cmVmbGVjdHMgdGhlIGxhc3QKcmVzb2x2ZWQgaW50ZXJmYWNlLgoKU2lnbmVkLW9mZi1ieTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPgot
LS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFv
cy5jCmluZGV4IDQ3YjcwYjVlNzA2ZjIyMWMwMWYxYzBhZTNiMWFjYWZhZTY2NDExNjUuLjlkMTky
MDNhZTRiZDdkYzE3YWNhMDY4ZjVlYjg4ZmY4MzBlNGU5MDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwpAQCAt
NjMyLDYgKzYzMiwxMiBAQCBzdGF0aWMgaW50IGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcyhzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldiwgdm9pZCAqcHJpdiwKIAlzdHJ1Y3QgcWNvbV9ldGhxb3MgKmV0
aHFvcyA9IHByaXY7CiAJaW50IHJldCA9IDA7CiAKKwkvKiBUaGUgaW50ZXJmYWNlIG1vZGUgaXMg
b25seSBrbm93biBvbmNlIHBoeWxpbmsgaGFzIHJlc29sdmVkIGl0IGFuZAorCSAqIG1heSBjaGFu
Z2UgYXQgcnVudGltZSwgc28ga2VlcCBpdCBpbiBzeW5jIGZvciBsYXRlcgorCSAqIHNlcmRlc19w
b3dlcnVwKCkvc2VyZGVzX3Bvd2VyZG93bigpIGNhbGxzLgorCSAqLworCWV0aHFvcy0+cGh5X21v
ZGUgPSBpbnRlcmZhY2U7CisKIAlxY29tX2V0aHFvc19zZXRfc2dtaWlfbG9vcGJhY2soZXRocW9z
LCBmYWxzZSk7CiAKIAlpZiAoaW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9TR01JSSB8
fAoKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
