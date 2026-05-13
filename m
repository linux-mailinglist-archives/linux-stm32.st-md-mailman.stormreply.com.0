Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED/SBl+JBGoxLQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 16:23:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FE534F74
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 16:23:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F44FC8F289;
	Wed, 13 May 2026 14:23:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19EEDC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 14:23:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64D8mBuR3474744
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 13 May 2026 14:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=aXgSSn27XG5QktxMkuF7jA
 mn6KmQ3QqMT73PjLfre2s=; b=XDZU+OE+cRby7iIoaJQu3bRDUpjLRAuDfY4cSJ
 D6CMEdRvkpq65Rq1yZnQB+o0EcafSTCAyJMg88i0neUAs3xw12rqSF6QIF8vF79/
 w6w39tkVwWdg0aBI8O27c+5eqA7BAyUgj85H8g3QL4uihOw/+5qoPfXcV4NRCCBG
 ozlXcVGtn3R77wYhXGyEgDMx+v99TyLQgqhQJ851hfCWPmYrIOvAGGM993zsjv1c
 uG4OLmrmYJIzq1cYGLhzl7oJyuCubXF7S224rHPzVEqKMtH2hGip3wlLMlGdDx8t
 I7AV9rXm8U+O/HZ/cEMwt2Hqycz4porw0mlxvwuPH1zo/dvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4198ja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 14:23:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ba115ab6bbso66960365ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778682202; x=1779287002;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=;
 b=ilFdbioMkR2TEBApLFIj80wCM0zTLC1sfWOMUE7iWWclHqNFB5rfMdFnIjo2OgHT9U
 8PNMsdJymq2/tf5Gq8VznV5499DFmmKRC8uwwed1Aie1fM0i2KncFid8gB5gylrZsLQp
 6QOolLSfP0P8Lgyi1ZBOMgnWkxi98ObzuWhh30h6wow+BY4wYb/bZede7O2yYUs9gR5Q
 ijw97q6bAQNDk2SNM2qH472qPaRcb7UtcMmf8U2IJNKOHTvEssKsAMXbGgM2JduFGC1T
 VyOLJRAhlfAjRs8fKWMkHtvXJIJgSzFFqJYsHdmhf4iARgOcDrYsweQVNXzrGjVHHNHQ
 4B9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778682202; x=1779287002;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=;
 b=Bz5r78YQ0ZVlrg5oqbZh+JzinicMIw2aALCB05ZpBax2msa6oDI/TqL8BgY9vRfJnq
 59Z1X8MiM2jsoqbkH2iurlZTD/+rY9fY12fRKSR+uFrGpdfd+0VZKTAurM+alkButZt6
 EFMTeDfuqeqTQims28THf9hAHL72NR14TqmnOz+Inkq7AH2/ige/5EN8iPnDfauv+oFl
 Ercvvdx6GmVrIN7v67gKmgyG9x/JafyJddlpIjK7FMNquuyZBm+LOxmQnMsZIkpniA/J
 ANfwuRkevSgP0BoqIoJR4EwKE2sGJWGHwAS4UDBDi1093kBxGP/Veodfjkx5/p7qOfn9
 m/QQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ83NalQnfdWjwe1lopAr8wwxvULV2k8z7vHxOG0dm2Y4DROqpyorncgqiQ6684/VF+BVXqjhAqYXP1RAA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGK3rX+Et7vwR2wYcpr1Khe0oD7CprIWorSDrEbFwpK7AkctRt
 V8B24kgF41bphqZmWLf2u0HkcbdO9iuw37+gCfFxS0uqDeAEG1BwJtzuo+d7TPN5hwulEhWy8Bi
 MCxQaVRFixNH3XKBslcIFn9M6N7UZTesp+fmD1d67BnqmFNkVB+X5saSlvuWqA0oMTqVuaauuxh
 ngSAEpR50=
X-Gm-Gg: Acq92OF/JZ3Tv8hCXg9BRVEIOESb+8gKj29ec2aUSjMG5TJyCwz8th504QERx4t5ZQ4
 kjaBvm8iM2TtpKgrk27V6kfinQebXiiG1NyJ7B19yfTLgBcGU3elX87ezcz1SgwYjqZspRt3DfQ
 LigcgEO7p4RT8OL7Pa2ifDdU/c4s8GGLgzpoAXFTDS64xplC7f5FwUpKfxjEzX5ZyrU1mzHtjBN
 DanmLiRwStqJR4p3Kpi4ip1eqmG+ZHshLH5O0KBaLbjgyNdmesGk6zPKuRFfgk7hZfQoje4F9ZD
 3fZPc3e0JjqIX91VVA7K4gwAwnCQcj+PbbuERcFunc6X0CtVi9LzliPmR692SxSBoC9er06rBaE
 lBLu+vxLTt+BsrYe7/hPZyDV+/PVITSsaoEGNYJt/gIz/2Q==
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id
 d9443c01a7336-2bd27158ce7mr31344785ad.10.1778682202358; 
 Wed, 13 May 2026 07:23:22 -0700 (PDT)
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id
 d9443c01a7336-2bd27158ce7mr31344525ad.10.1778682201746; 
 Wed, 13 May 2026 07:23:21 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 07:23:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:05 +0530
Message-Id: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEqJBGoC/3WMwQrCMBBEf6Xs2ZSY1gY9+R9SSrNZ7ULT1ESLW
 vLvxt6FYeANzFshUmCKcCpWCLRwZD9lqHYF4NBPNxJsM4OSqpG1PAoa+dN3znWI3aKElnusamu
 NrgnyaQ505dcmvLSZB44PH96bf1G/9a8qRwqDEhtrtTZ4OPsYy/uzH9E7V+aCNqX0BSEHayezA
 AAA
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04895b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8r5jHq557GnqU3WSqWgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX989XqsXunlJ9
 j4sBp8l6gqVAmjW6fVzEKDhcf1JIxOVGYlY35/p8f4Bb2je2nBu0zrnRCyslN8r3Vnco2A9RTZ8
 TwjikOoYo9sIusX8zHmgvSZBP7WeF55d96FE2jTd/4EgGo3/6L76GCtkiokPWmQyh3yS25aZWJb
 +5x0uUnWOq/Al2bh1dIQwiIe/kG0KI1Uc5JIoImTQerzB3EAPSmYmhf5YEt822z6HyepjpngFQN
 KOnVlj9WeDYQohC7nR8/O9H2WVHoW2x3LAZT36Aa2POSifwRv6aUsSMhpKcnMH/6RGNgkr/gbzw
 LSy37+KHO8jF/fv6PDfMjQ4xdjeyWmilqYmTP4c1i0iaKmvx+yWrhvowOZR98xviqla1ePJOE9O
 hm1Z6dnvCEAHCp56fIMppyDM3EFXmimSFJkrg2gCs81i2dZuFITcmSmByb+vnpMA8ZKo1tZiYNu
 t/18xL3K3YsUH3kW0gw==
X-Proofpoint-GUID: hOf2_sZN5n4NwArtquC1JUvzhjWjX4H-
X-Proofpoint-ORIG-GUID: hOf2_sZN5n4NwArtquC1JUvzhjWjX4H-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/7] Add support for Video, Camera,
 Graphics clock controllers on Eliza
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
X-Rspamd-Queue-Id: B18FE534F74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.708];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,qualcomm.com:email,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   11 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4677 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
