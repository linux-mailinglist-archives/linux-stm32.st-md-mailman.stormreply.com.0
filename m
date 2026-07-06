Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CcA9J7SrS2oeYQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:20:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D287112D8
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:20:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=Zc1EkE2C;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=Yaga4kG5;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F15BAC8F27F;
	Mon,  6 Jul 2026 13:20:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7815BC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:20:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666Ax99D391062
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 6 Jul 2026 13:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /oqnZuDdWAmB4m0Xe06rkenFSd7BVIxfsMiqDGzqlqw=; b=Zc1EkE2C3zUSYtNN
 NM/DcPdWj1AtDGeGqjBFYCyBkvEPYHsJ5fCub2NWHFnmT3KR4/sN3QvrSUhvTMhO
 d5hTR/VBmPUVWumMyBPjicq6JVY2zNnhFdEajv51i9emAbCSuwJ1veKIjAZvnz/X
 DunhnNrvJ1Wn6X3aVYZXqe/6aasHMlbDM6u2/x/BsuYIZ1UrGCnrTOgqda3ee1SW
 QBNAI0A17cWfGt5o+M41r46xzyjeUDJh0ht3MoK3c3hYgHG0uj5Hw/Duu1KOJbfP
 hBYV9xqmDoKL0yZ7YQGsVxkWziU1V50lyWnOE3GCQSTwTSLtiaPXYJ0UaipvPxAX
 3W+1kg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrwnc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 13:20:47 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5be1c53e800so2545323e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 06:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783344046; x=1783948846;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/oqnZuDdWAmB4m0Xe06rkenFSd7BVIxfsMiqDGzqlqw=;
 b=Yaga4kG5R44Qnuc2n+PDWjCwzR1avRp7h/CXRcy8N5MiX8vGjn05m4DdVqnFHWpTsq
 ZLE5uDyIy6PSUfNRWM7pTC6XoSnAWieuABHt8cet8O3gIRgUCnEJwtSysTs1rH8norGP
 z7xHoz47iVFvxH/Ny6fGrNay9nqk43zxF+yqgYR7booJRn9trIW9LjN6jUyyCFtxf/4r
 LojgClwY5/XOUyKXP0nOVybtM0ylDCv3rwb4cUHLHteouzjasgA/EmRsa82zSZRItaCN
 ECsNHNmjLY1QKsJ965YwRGQmvQchDjfPtIx9FQdfTu1LN9S45FxBICbzlMmKSR+St3i8
 YRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344046; x=1783948846;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/oqnZuDdWAmB4m0Xe06rkenFSd7BVIxfsMiqDGzqlqw=;
 b=e9EMr7l61YMcbF6aRAAyAr9VRrVqb9NQJ2hGhzy0mk8iEelgyUo3KWLfqAs9vtNKIE
 2/EZcf4v52onyWYQOLNrPp/A0XCvEAHFy9iJJWkwPSiSQRZXOiVKI3CnZ3MvLfH4dE6v
 MNpOL+kD4GguFSbOPCygkTVH3T9wQgvFoqX8UGJxDRTr/hpESbRhiB4vbvSw2figh5bF
 MsCMSR2P0nhAn6hh0+kOsIpJd0T7fD45hnZJbSeRqc652cj367wUqTcTVNtUPHhG2Fyd
 uyr+HGShC2hbZfEiuoGo4iCyV8tEqShgpeC2CWrz6ZJKLblDNcweYZROFNjqsrERfYzW
 o4+g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rri2/QM7my5mmvGKNHHR8JaHJJhFcrU+LiK8ex0o6M4jFBVaYUVji6AXd0ItLINhwdR0BP+KU3H9qO72A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwrOiZ1Ky60fBt8ssbrzaAvxS34EEHijL5Wf6MQ29ialKQwVHKy
 LyXgEOAAxMcRjqRyHsHJZeGmr0hSkv4MFsycmjiD7tIUR+WWfyi+08PWH2wfTUcUe4vIhjwArot
 ahIcNKz0pzypWo4Yxx2v4Vqmw3wh3qg5a0fzvj2g/ssLbp+eKsxggGennb7Y1WUJkS6ND8OARAD
 k5RTSaA6E=
X-Gm-Gg: AfdE7cmp1kWVcmoNiJ7bMbi3aQAv+SQ/LHOQgM+PoolayZ472LynG5zch4lgNjcS8ds
 sk1agJpApLbOnfN6i/plZetQJOmbmxfH3JljOHBAOxxwIQWW9Ux0EMG0dSt+8dbb0YM/6D4ZQrO
 FEoV22B7qkT5WmtvpZvAYrzmzUWmceXsEQNlyIRj28Qe+eeMPOx1P6NHdU7rtfweRjiMOLui4Du
 8tDBJMYSoqkXnqA1EXUProKQGVIAi8VQne3Ai0SpzmQwWZISieI1sYbE1AmmfUBgdO6SAOHvh6G
 r7bOeOg3WTngSFgcESeqoGurfytPprJX9G2XaySm0CA+cPXNQs/0Myd6c+QCeiQLsO9oOb39M9z
 mr0IZ6KuJMduupkRfqD2n15kl6BHOga1qrJnz6eX1
X-Received: by 2002:a05:6122:278e:b0:5bd:7fbd:ecec with SMTP id
 71dfb90a1353d-5be908cc9b5mr280355e0c.13.1783344046428; 
 Mon, 06 Jul 2026 06:20:46 -0700 (PDT)
X-Received: by 2002:a05:6122:278e:b0:5bd:7fbd:ecec with SMTP id
 71dfb90a1353d-5be908cc9b5mr280300e0c.13.1783344045804; 
 Mon, 06 Jul 2026 06:20:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 06:20:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:18 +0200
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-3-e3ab1ecf2901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18313;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bPUJkobfN6fP9zKkpofqwMZ4l6iWzFjo7phamyQJ86w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6udxd1qNa2aw7JDmBK0vi0huQX9bnFy163J2
 xffS1j1QlOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurnQAKCRAFnS7L/zaE
 w3xWD/9CgoIk0wekh7MbFUX0iMEmiJZn7NZhz5BfIBt/zAxYE+L0gdnjfJHup+g1mSeZ2M5MSvR
 iZHR4o9Txq9bczxg/Iy00Xk4283TayioDlNNlpVabN03Kydd9m68tR8xuuzIa4efJUe9hiF0J+L
 DgAYTMatYfe/lWQvYyhXAj+st60so2GNfAW+8t5wBcLVxRpH/g5YcOLksWsDgz8tZZT85qbbpLc
 ZTCnelc9X4RyfRKliAkO0xHHi+8FabYXkkizu9+1/bCF/gVzd3iT+DSJpawpadmfuvJgzGCUFvz
 I8Hio8QQRZlPnWogN9OeWE9dCh59NPWNBRMmwbcplgIfl/jK+ehN9IDVnlFo6HQFKx/M6x4z2Oo
 Xk5dz3Y9Y8arIDNnLbCJYRHkPsttAdpgw+05u8BwQDpuFh88W2Q7zwJrWlIRrU4CSGoVuUfd3Oh
 rnEOgFsmXfx8Td1dMlfxBM6fveZDXuwFgVq9c5ilTz18gP7RE2n3ptlQfuaz//AVv/g5oV780mD
 R6121mrjwMTNm4yo26k1WbNDKmRgshRCSe3OSurPTlMNrTKlCZccivsN4iteVxiRaM2gB4dcAXh
 JaCf5tjKsx2mQ2jMjjRpL8eLwzFzjpllLk4in87d7OYBXkRuIVccB06lgYHEn1/Tv8hcTzQhM2v
 ttYuuW7k/h00wmg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sSXElT_PW5FKL7jbWBjlkppa6Rr7QYR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXzUO3DQkw8H3w
 CXoAFiyZcT6NQFIctD+PbcXu6ZeCRVMypQvVR9fXS/9a5bOm443vR/A4/jjP0WI038P8TWrgQu7
 Ea7mPA9bJtFt2/TnIH6lmg6nNFLBqMh6RbLynkPYjMFXUDtIij7OeHw7L+AawDQOa5f4eJqUVFT
 2PTUllIEBZGSV9qXCZXv3eO9W7UPaNU473+P2/2gAUYMoeFDDdciSJ6Pq1l/85YlgbI3d7Rehee
 gteQT9DYleMNFFFWqM1cKOiO+73Pd8xSMAL6ckDIZ/uHDDmG8mb3SDN7a4PtXZZpCDWG+R+zV5P
 YgS9Tk5FnkNhYyQnvhD3fpRysbyAwpeg1dic8I3pQqq7LKq+tFQn8tJb6k553nNxSPuNJbbiAF6
 QUJvJ0GHpwMd08SJg3gKaS3d+R5Tc12dkJVnmsvCQgTowdv8p8DK08tpOVlsfPE0YitPRTNK1DM
 PVQ1jzxTurwVFWlagYg==
X-Proofpoint-ORIG-GUID: sSXElT_PW5FKL7jbWBjlkppa6Rr7QYR1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX0p68Wp9Ron6f
 D2GjyB1m4qUV0Ss99P6AMKmYQRLD++zTmy65CUG8+hPzJJ4XaRSzBZTcBVqI4ORKD/xAdDtH3Zu
 vYNl+8VBYNfdB2MgrxvXbg/k6wJRV7g=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4babaf cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=yC-0_ovQAAAA:8
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=RHTE8E8__7OEo5vASDQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=3gWm3jAn84ENXaBijsEo:22 a=d3PnA9EDa4IxuAV0gXij:22
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
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 imx@lists.linux.dev, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, brgl@kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v12 3/7] dt-bindings: net: qcom:
 document the ethqos device for SCMI-based systems
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:imx@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:prabhakar.mahadev-lad
 .rj@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,lists.linux.dev,googlemail.com,bp.renesas.com,kernel.org,lists.infradead.org,linaro.org,tenstorrent.com,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32D287112D8

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file. Since we need to update the maximum number of power
domains, let's update existing bindings referencing the top-level
snps,dwmac.yaml and limit their maxItems for power-domains to 1.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com> # For RZ/N1
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 +++++++++++++++++++++
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
 MAINTAINERS                                        |   1 +
 24 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
index 23e92be33ac8609a16db530782989caed22a5730..b12632545673b2ad0148a677f45a7447309a43cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -40,6 +40,9 @@ properties:
     description:
       PHY regulator
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index fc445ad5a1f1ac490e921696d6f7ca83d15de459..448e617cddc4cda8dbc77e83324495ffd5dfb9be 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -140,6 +140,9 @@ properties:
           - description: offset of the control register
           - description: shift within the control register
 
+  power-domains:
+    maxItems: 1
+
 patternProperties:
   "^mdio[0-9]$":
     type: object
diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21e617543b03c5a90b993f8aee053c..9c9cc3ef384da0270489c21b3426572ea46d9499 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -158,6 +158,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 65882ff79d8d7e3227e31415676639dd86f7098f..081a21174fd42bc4925d1850b1147545e111363c 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -95,6 +95,9 @@ properties:
           - description: Optional offset of register controlling TXD delay
           - description: Optional offset of register controlling RXD delay
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
index 62c1da36a2b5a29290e5e01be87c48158c4adf89..e41851931b947559c89b0cd6f4756f71046f9594 100644
--- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
+++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
@@ -47,6 +47,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
index c4f3224bad387b87a5b4a3049dabd75f2c4bd42f..c9a131b8d8304c41559a416b324df749c0a87d14 100644
--- a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
@@ -66,6 +66,9 @@ properties:
       - mii
       - rgmii-id
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
index 99001b940b8361f69bb917617f857ee99f4b3fa5..49db18423dd807683b9bb297978f5da8ea6cee3d 100644
--- a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
+++ b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
@@ -65,6 +65,9 @@ properties:
       - mii
       - rmii
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index e5db346beca9649be4f97727b78fda8973095912..b240c76e7dd5254d0c3752610c4aa848a3c3d65b 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -83,6 +83,9 @@ properties:
     description:
       To select RMII reference clock from external.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
index 05acd9bc7616356e68090ebdd4df20e42f70dd7e..f61188ab0dbe3c0cec5b10f7a65dfaff4dc3898f 100644
--- a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
@@ -51,6 +51,9 @@ properties:
     items:
       - const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 753a04941659b82b655dad1439ff66f8b37fa18b..fcad2274302d9cff36760184b74918a9835906f7 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -81,6 +81,9 @@ properties:
       - const: rx
       - const: ptp_ref
 
+  power-domains:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..ef520f8105773e22c0536ff419dad55fe316e1bd 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -86,6 +86,9 @@ properties:
   phy-names:
     const: serdes
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5158481e5e5b0feed5b3dcd2cda2f593b7ff62e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,sa8255p-ethqos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ethernet ETHQOS device (firmware managed)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  dwmac based Qualcomm ethernet devices which support Gigabit
+  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
+  managed by firmware
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ethqos
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: stmmaceth
+      - const: rgmii
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+      - description: The interrupt that occurs when HW safety error triggered
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: sfty
+
+  power-domains:
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: mdio
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: serdes
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg-names
+  - power-domains
+  - power-domain-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet: ethernet@23040000 {
+        compatible = "qcom,sa8255p-ethqos";
+        reg = <0x23040000 0x10000>,
+              <0x23056000 0x100>;
+        reg-names = "stmmaceth", "rgmii";
+
+        iommus = <&apps_smmu 0x120 0x7>;
+
+        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "sfty";
+
+        dma-coherent;
+
+        snps,tso;
+        snps,pbl = <32>;
+        rx-fifo-depth = <16384>;
+        tx-fifo-depth = <16384>;
+
+        phy-handle = <&ethernet_phy>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
+        power-domain-names = "core", "mdio";
+
+        phys = <&serdes1>;
+        phy-names = "serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
index 16dd7a2631abf6fb7dc8e0c90755ab1e81915b38..ed0d10a19ca4c47c05f6873c64b0537b90acd15a 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
@@ -44,6 +44,9 @@ properties:
       phandle pointing to a PCS sub-node compatible with
       renesas,rzn1-miic.yaml#
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 2125b5ddf73dadd8b0d372e83a6b5c4624f5e648..8338834f49cd21df6c697a1f52a8b195c0208c23 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -154,6 +154,9 @@ properties:
       Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml#
       (Refer RZ/T2H portion in the DT-binding file)
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c4533deff85b052157984d0e2f23..3ec3f6dc2a125908ba98f20b1120311de8967954 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -123,6 +123,9 @@ properties:
   phy-supply:
     description: PHY regulator
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2449311c6d28ed3fbf8c92526ce8b872900653f4..d3aff1df3070d1b22198766ee2e0131dcf925287 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -72,6 +72,7 @@ properties:
         - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -185,7 +186,8 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -630,6 +632,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
index b89456f0ef830991135bd17626da98661429596c..e78cbf594c695204040a53ab1e367daa9e12246b 100644
--- a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -49,6 +49,9 @@ properties:
   reset-names:
     const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index e8d3814db0e94fdcd0f3ab2a9fa8bab972a97ab5..845e2c67d20037496bb1eec6eb73c99cde74e944 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,9 @@ properties:
   interrupt-names:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index fdcc61c65f87d1dc15a17b9486cde032ffa7798b..c424e77973921e1f9f18135c3106f1c270c9ac87 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -75,6 +75,9 @@ properties:
       The argument one is the offset of phy mode selection, the
       argument two is the shift of phy mode selection.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 987254900d0da7aab81237f20b1540ad8a17bd21..29b878079ff0c1a0ef95fc63f2035f478ee039b2 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -121,6 +121,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
index dd7481bb16e59982c26c1a54ae82b8cff85fdfe0..ad635529d676ed6b752ab3bde5152d5cbddcb519 100644
--- a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
@@ -67,6 +67,9 @@ properties:
       - rgmii-rxid
       - rgmii-txid
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
index b3492a9aa4effa73fadf92a63a76ba8bb65a8769..c859f8bb5d582af8b8782f2f89ab5e6ee3d7a46c 100644
--- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -78,6 +78,9 @@ properties:
     items:
       - const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
index f0f32e18fc8550e6f63b87b60a095972453836c9..efa39eab0256a1102b01872bd848749788c9b4e8 100644
--- a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
@@ -48,6 +48,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/MAINTAINERS b/MAINTAINERS
index 4a8b0fd665ce2447c3e89784b142d998f7384b95..7d5877528df099d546929bc145ee9e7233391105 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22184,6 +22184,7 @@ L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+F:	Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
