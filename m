Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YwWOLUXmVGr9ggAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4519F74B7B4
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="fvEbp/wF";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=IhJXyrcA;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8473C8F274;
	Mon, 13 Jul 2026 13:21:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF0A5C87EB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCEIQu1516840
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 13:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=hfRURqDpHH7Ph5J3GGOO6Z
 nOABreVJWYGYBhKkxgrec=; b=fvEbp/wFsNzg11M7LQNQ51gD1kGwNTk8PQdlXO
 NuGzAUEVzNdgkTPCZdFNTRVC0PTMkAKktJlMtJnuSl3PSTr5KgIglPJ/FDcfQe7f
 ILMI6k6k5W0ygEWv7N0O/oj3SQ5euwj0fXouOkUXQ4kLjaImb2kORNkbkvKxUCBt
 yx4Al06T+SRX2E5xrtzGPmYMaO3acyjTr+DXutlA9ADXQBWNuf89OSAg5w9hYT2Z
 2zu4bTFmFl9z3LUmpT0vihmMWd+R37kSqnzph8pBkazGkSdedXv2pa150+sYOsyT
 CVNHoIK/8T/EkKMjzaJJflFFcVL1MLWiBfLHLTN2nyKmZveA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubssc84-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51a87ef9713so44405641cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783948865; x=1784553665;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hfRURqDpHH7Ph5J3GGOO6ZnOABreVJWYGYBhKkxgrec=;
 b=IhJXyrcAJKBTWrv73Hu/3VE4wuZhHX4JYQpwimnIekkRy/njs4MGkdeaYEiDIYWPZu
 pUIoxmfPBKBaAnEy3kbJtR/ZJPLk9n4RjEsiLRo7oyl9If+YGHeu8QS+KPVckLKXUV4S
 OXXgg6IjcSwOCPOEZxvws1kecHI5XwBfFLqX34ulVLYKWttUIVF/fBbjUiotxpuOV89Q
 twrnHCR4qOo+gqJCJm4PlLhnwt/hHUGRxZAS3a9loN3pZMKH98Bl6XDV/gCghE9BPcJq
 khvzE0W6eNrp5N1K+qi2Fg31CSUHmAzpkP28iqvS1K8m2Wq/5VkOs2QmsM4Mq2CigcV3
 u89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783948865; x=1784553665;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hfRURqDpHH7Ph5J3GGOO6ZnOABreVJWYGYBhKkxgrec=;
 b=AV53rLb1Tjr1AWgb/bmYLiZdlpH0jOO6YFWhkTdjGCTO7FdSZD5mHWAi0AYcuUpOl9
 D3jqDlQG3ih7Tdpu/aTUZYgxMBNutbfahMlB0QSJFYkOu5WOGDxd9P9JfFhsvV1Db986
 39wn9Kq9W0nlGd7A5LGZ85IwY9eaLKVwbgrA0DhyPlLH9TVgzQbqzAg00efT8/aVkuoT
 S3HJ2WE+jFzMfxZa2wOwGIWqun2UmR0Kex28UJ8LxlZ++RLjjyt8MzBvalhKtC4OOEty
 zPrYV+42UCe7tRwnFur+U5XUpZ2e0a92YmntKNKBeUqD7Te5zauK7KnT6rdpN8dN+k1K
 xVZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqGyrxba2tg9P8xriO0aDJM9ngLUfSt8+bLrSHyT9uenGWSuSYaiAos5NmRJ8vgMYYNn3aH5e5lsXyAyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzFeBgrTDh/nRhie/h/V2/7yeVrqHgpUWFtYRRtOsfcr/vwC6x
 ANi0r9TfodNB00PKwVV93bLCUcg+TQTzugXMp4EFvJMdOHu6RyJ1FM3rN7DaasKI8muBsiH4xV3
 XGd8qckNxumGU8n3UHxPJa2hBbyFhN897jiFnuEHzN2ACyfmKz7vjXYoWqZGA12BCx520mCJNFe
 J9ADgE2Jw=
X-Gm-Gg: AfdE7clA1wc4/eoRxePpN1DdXBgwaLkh1xnfAwZip/Fs12TAMy2zcXmqtMcQ2Zgy0bA
 fgBucA7tCjphvXcBE2aYJEYE3eppB0NB7oAM2Upe0cgIneV9zwL+LyVjfU7FSIn2sdHsINNmCO7
 7SuwOwUI26IPYO3RAKEN0YYado0LKMOPahfiPSQisChJ/gpUBrcWnOJrxKD2T0oJFHWoH9/JSrP
 HEZpJ8j5AdThBy/mODiYAOU5v5TdBqdvfWvcJ8qkLkYmAkngghS9EG/N3V/KBjFShWCEa8RmxfV
 vfDd/vwsn3iOb3In6oVkkCI1lJO8SIGneycJ1tcNEErhTVb8Oon+mPNlIfEXM2ZxDUoNPPiZlNw
 PUNa3RA3hTjSwxFhelKLnb1Enef/ria5uuDe/1/uu
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id
 d75a77b69052e-51ca9eb3ad7mr137236601cf.0.1783948865280; 
 Mon, 13 Jul 2026 06:21:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id
 d75a77b69052e-51ca9eb3ad7mr137235791cf.0.1783948864698; 
 Mon, 13 Jul 2026 06:21:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:21:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:29 +0200
Message-Id: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB3mVGoC/3XSS07DMBAA0KtUWeNqPv6y4h6IhZ3YEIkmkJQIV
 PXuTCNBK9XZWLLHfh575tTMeerz3DzuTs2Ul37ux0EmyA+7pn2Lw2tWfScLDQEZcKDVZzse1Bw
 9GfOh8iG2ymsLxCa2BqmRcx9TLv33ij43Qz6qIX8fmxeJvPXzcZx+1tsWXOOrGxAq7oIKFFN0o
 S2YrfVP7/0Qp3E/Tq8rt/A/gUCuRrAQzjjrUiCGmO4IfSWw+rpFC1GctRbAuzbHO8LcEtUsjBC
 AHWeOsbC/f4i9EoShRlghtHcFwZO2mJ/Ged5/fsV32XrYy3D5eQEsINIW4G3kTieKned7YM3E/
 WVigcHWICdQJxAgQ9DJbUD+BkKsQV4g44lckvoC+g0o3ELVjIJArfGBdXa2FNqAEG4k4mrHwaV
 fAgMlYh/RblF4pSxVC4aX7sXkSgomGSxhi6Ir5eo/LgUFJb2TMLeFAmCFOp/Pvw+7wMPNAwAA
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6708;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wJ6u7rSru9bjD27GOXDKK+K1168IHGuH2iyze1Q5fus=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOYqJIcmkwYp17F35Q8kTvJsBiw9zAmhhOLsT
 WAjXrTwRLWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmKgAKCRAFnS7L/zaE
 w8BuEACjZOlaT8zacQ9IgDEs76j1M/6OJ8WclWLisbLOgrWOP/NVwscsmn5ESI6WkpzjxALZeQ6
 CqqVYllMXRXVzZFj8lPYpunpB9M9Z+dQhw7PGQI7UFy+a5Wf843v+5Rfcd9yS+DQ92/A/S4ZzhJ
 8+kacB5ZG1k2Qb1F5QtFwKyXcaJ59BvPr/fslxexKJ428xGtiEJxTVrBzqpbcc33SgCg9lBtt8D
 6g+a1JgehAS1FBiFzEj2LSlsACsXhoG7DE7O4/7FC4ILtLI/UzwpSSgNaPWtJi3YVrQubehLOQk
 Z9PyWnTYx8x6oUCTIMGwiirM21JPKolWw0EbB1kLMl1c3ZhDOLd4h8m9dwTcm4yxhvsISB/KTrj
 R9Wlp+ZqVbsqeS7hUjVYwnlNC2q0rgcjj37+XKFagiAG62HoyocG2MbBp8CwfAtROBl6rUpoMM1
 Ky0d3wAgz17Lr5jWGO9Hr9hRJTuwQBUO8UkIeQBsHSeuvZnqVX4MqXwBFrjVmfPF6tl+wjBzqbM
 xRuhIpSG93GflXf8zr6Ep3DxiCkwnuVRguVEVvaYfSXoliUJFy3lw1DbrDbCPfnIZHjwNBssv43
 vrSMLo0QfT4WxWsZOKBVCD9PsN+LvEMPmwYbVmDTCYpErCaLXhhN9urrKN8LheKxQF40X65SEhe
 U5jyS2uJ8IXPU6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54e642 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=ExEFSxjP5R7i3UFV54oA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: Kh4ZE3W1De6s2obHUVlRKqpXADVRBVDX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXxil5BHOSTsNr
 Z3wzZ+QIGyby22yQch5wSKQFWJ0jxWTpxg4E00M9kko1cYFxzLcKmUB6/PZMdAbvmkOxXj/e5qJ
 YltfCmeICGQAjsfKi9clh/YElfWkxwI=
X-Proofpoint-GUID: Kh4ZE3W1De6s2obHUVlRKqpXADVRBVDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX57OQmH9z66Y7
 bd28mTy8IMpsiGeXxF3HMp1jLMerxNwVrbdltpqwRI82Mp0Wev21ozdiEppVN2zYj1n7PAeLkAf
 cjk5hx1CrAxzKKYa9zcf1D1Z8GcATYGySz/8e+SLcwzNTHdzPED9ywsb3M0FmCdqsjzrUFyJDUE
 ZtOd2s35bh6NNyTO/Qr3sBo63j+yZCLBMb4kt40yZuQ2vOdqIPQayuhDTBnhJp0Up+19imEprKI
 3/Rcf7YMLlWwdVdnWF9pNzAXFFIHkPB0ydMQP+gBJlxqWEFXn6AsnLe1OlRVGdnlaItMaLy7d8y
 sUPSkvhRpI2swbxzJb5Rma+chFRLY0/GYVMPCgOK1cTcUTfvgdUELcvuWlm2VDXn3x8eaZajstz
 AKQrChemVIm5hbDkrJYGbEqyz0QaXtKJpcN19cGtFQ8q8n2vXBd4vXiZI5BPf+deK/aOFN/Ha/E
 B1hIJa9lIbu2HbIjobg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, brgl@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 sophgo@lists.linux.dev, linux-amlogic@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org, stable@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v13 00/10] net: stmmac: qcom-ethqos:
 add support for SCMI power domains
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
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-rockchip@lists.infradead.org,m:linux-sunxi@
 lists.linux.dev,m:devicetree@vger.kernel.org,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:sophgo@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:netdev@vger.kernel.org,m:linux-mips@vger.kernel.org,m:stable@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com,linaro.org,oss.qualcomm.com,kernel.org,googlemail.com,bp.renesas.com,tenstorrent.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4519F74B7B4

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (10):
      net: phy: aquantia: fix system interface type not updated in forced mode
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
      net: stmmac: qcom-ethqos: fix SGMII loopback not set on resume after speed change
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 +++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 246 ++++++++++++++++-----
 drivers/net/phy/aquantia/aquantia_main.c           |   2 +-
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 165 ++++++++++++++
 30 files changed, 593 insertions(+), 58 deletions(-)
---
base-commit: 141ee96ad5c69b9d33b2b50ddd49315671023726
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
