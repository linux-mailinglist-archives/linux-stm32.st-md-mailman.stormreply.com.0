Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPTWJFY+wWlaRwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 14:21:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F842F2C2C
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 14:21:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7BB4C35E3C;
	Mon, 23 Mar 2026 13:21:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2182FC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 13:21:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62ND7RN12191074
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Mar 2026 13:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=vI/1k+nqYj3LM3ZnQClELF
 8nYZoxxBvQftKyxpY1xZs=; b=o0bGsK2slcntOm/N0wLXwMkCP7ZYcVI1Y46NYs
 zz1sziraJPBbRx+EWkgCeop3Oixt4aIp8ccE3ZOfx5BquubnaZng/A/otlog5jJ6
 z4gzQP5OjYF/qCZ/ZO0xeVZeoltm4BPfOvYolTrg4Mc5i4NBdu84EZ1nD9s0G/po
 WGJy1g6aNmfFOCXQ3MidKW5kAck1o/DPksVHHkbxIj9DEo8MJ8EWRDpyXPbWuXgZ
 dV9tNn5JTvizT6M+ygi7N1biHlD0cvbDSrTb+nW2SVjzQC0T/Q0AhMDh5xwEjH4q
 3wu5YQpkSqNvTkenDT1cIwGyh8gm0wyXxI9GPna7KFsx2Kqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jr2jw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 13:21:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50b3544bc7bso1951311cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774272081; x=1774876881;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vI/1k+nqYj3LM3ZnQClELF8nYZoxxBvQftKyxpY1xZs=;
 b=ef03MzIkvAj3/IWI6Y9uzTE8NHMU9P5R+fIRecJRcZ6d40LHJAudAFMNRLMbIilvuk
 a5iqw9kQgzSlxT90AH+vi0SfzReimKUbydsr1ZYSIzJaKaWUvJyy4VCyE26wDB+kjJud
 fm0IQofkrZ0foPwu2fNavbGZnh9Sx8k5mQl/hFzFUJfqUg/W9T6FeJM4tzLXiuMT2XIB
 t41Z3aANN8v0nRQE0gr2JaUOjdtGflD62ThNq/IeBnPej4Nkqwqy5p5K48qBZoSa0cTf
 YKo9T03E9Fi18sVuQ/myZcypNnXtL5/1JZJcLlfm9oGCMmXmL7Z1jw+zxDFH61oTupQO
 sGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774272081; x=1774876881;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vI/1k+nqYj3LM3ZnQClELF8nYZoxxBvQftKyxpY1xZs=;
 b=eU6VALsZHZ24QmMI+jCbwGIstDdM6x93O44LjdcMNCUaDqzMDrBlTrjOzD2PVTRjjC
 5CczRrTCHWUJes6OkR7ZYkoa8IqBVCFjFwum9zq+NGdVsLhXULCM+VhuhCgEf9VhZape
 Kww5aTPpviBf0DFeH7Met06glBgRVncfQnzY+Z0EV3A9f94gBumUtbDwbJwJKIZryesC
 B5Kqu01CTgfzZWb7Cx15Zg8Z68aK73LSbMeNx7jXRY4cs4+S8h8YxPg1l7vY+azg1nAV
 q+vByTCuYwqPlKni6rc3aXqAdjYc36X8AiQrDYZNJmQxAVsY4np/6krXa0M+Zn1F1sFH
 69Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7jgLbLENRl9bT7szBY5HiSQPky+6j8ecsiWG4Ysx106ittWQdANPD4FH87T8nefLdhFsFbZo2dgCHyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyhjFhjPEBIHaB2HfH1xieKT7u5YbBS0m4rmOSI0jBQMLzNmdlk
 2efIcuzeouqXO+pcmVdcbSyUH7PJaeHJg3UmMWCHbXPEF0eXE9TARF3p8XcZ+aikgM6JormSa/w
 SJzEAa7ueYk3cIj5v9nHIafmFtzKZaBR/BzkcGA2MCj6p+d3fJEzW/g3AVTBY9EM0X9/pH77Eze
 oSUUadIZo=
X-Gm-Gg: ATEYQzxpenu/ADg93U5iKliaeExH1/8mdRYuDngrAyHHcsbJ1Y7Mhlh6G5ehpyI2zhF
 vvSxW2ip012IitYzA6AwxQpcJPsRFxzVgmFEWm5RUpzpNkeKWIh6EivbommlWkyLHy69TTaceDk
 sDNdkVuZLdVzN6E6pjQFAS2VTMoqiqSD2xzAcVJaF1ukoOg8MU+tp+7laDzi1lpIg1IxiE6rI7A
 MCK/WAhgB21SXH3u9/vesuM0wtRBS6JGU13JS3mp0rCmoLaQNzkDwFP89jJUyV1akC6KMuaZ/56
 cBaInQgG69RU9Zw0vKaQmDAaQxFjZD4nR1CeTSevrf3IuuSHaW1yd6f7UjKhcWUFzvtHRfNsDCU
 iRqQxWSsyVVpdAQDq0QsJ0X7w6AnJTpbovtO6cc9v7jbKLG6B9aHL
X-Received: by 2002:ac8:5f89:0:b0:50b:51a0:f752 with SMTP id
 d75a77b69052e-50b51a0fd0fmr92226581cf.15.1774272080773; 
 Mon, 23 Mar 2026 06:21:20 -0700 (PDT)
X-Received: by 2002:ac8:5f89:0:b0:50b:51a0:f752 with SMTP id
 d75a77b69052e-50b51a0fd0fmr92225671cf.15.1774272079938; 
 Mon, 23 Mar 2026 06:21:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 06:21:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:52 +0100
Message-Id: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADQ+wWkC/3XRUW/CIBAH8K9ieB7m7oAD9uT3WPZAW6pNtNXWN
 S7G775bk00T8YUEDn78D65qymOXJ/W+uqoxz93UDb1MEN5Wqt6lfpt118iCIiAHHqw+1cNBTym
 Qc0edD6nWwTKQcal2SErOHcfcdpcF/VB9Pus+X87qUyq7bjoP4/dy24xLfXEjQsGdUYM2lHysW
 8zMYbPv+jQO62HcLtxs/gkE8iXCCOGdZ19FMpCqJ8LeCSx2N1shWs/MAMHXOT0R7pEopnBCADY
 mm5RaE54b4TtBGEsEC2GDbxECWca8GaZpffpKe9l6WMvw+/ICMCDSKyBwMo2tKDXBPANLEv+Xh
 MEAlyAvUCMQoIFoK/8CCg8QYgkKArlA5Cv5X8DwAoqPUDFRFKh2IRqbPbctFaDb7fYD3QgOBew
 CAAA=
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
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=62lf3t5qbOxIlaStdMXwEVkxERzacKVDrC+KBhgqa5o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5BAapgeuAII/igpPc8Q5Z/zNn8yHLPz/tCp
 ZAp3W8wW5mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+QQAKCRAFnS7L/zaE
 w3gsD/9/Dl9xaxiheSRVvYWnqhrPFyNVSpiwZG147FCytvuP+CGThjen3fCnLawlczMGnJizvlZ
 mo1gpTDVRhQZqja8nokWyHnkTRxnlTkYUkLXv5MK2Cp7Ly4Un3lG6k7yl6TI+AiR0tzQT37Rsma
 GqjgSPhb7TfibiBDaAKI5F8VK2iVULENWwTfSaCKyxcX/02JtJrZbdUm9VG6dKa5XOANEVfW7mu
 bJTUdUhk1LDZCjlN/1AROvTL2NQ/ENEWcXXAC8Q8HP/WlJ9qUc/zJ/UceVH1MtCBN0yedHhyNMq
 9Sdqx0XjJZnYNIrb7/wu2qNkGqn4M1KcHDfL/dL3euFCifPN8WjioVSI706yZqrf0idjVy2QHLz
 Tk5glZhJfciJIXTd6z7kUzAAUpMXD39PoG/T4vY4PRaMVr5ZF+sosTPQ0jSPRl/FnlSegyvY53M
 gKdnvwsUdBpxhtwTnOnuEUyy8oCEBgMKH77qJs6AEn1q/ZBFgytSInpjVoyMnYKVhffktwR69e+
 pJw8b3fJBTvwuGmtHexhhUwWCpZXee7Aw/JX6cW7JBF5IU2GdiaUfaIzdVVW6aZ/ssNZbPqRi6u
 XKDxVqIPAbTcoQ1Ym8FwqMNB30UMt1xKZeMqBb3PbnkJSpWgwhdwzn0BftA4j0xVai9SqgK9PCj
 3r3JMxXjRxZ0ymA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 3Qwd8dOzF0-snTUNMmQehc9ct1Bba_w5
X-Proofpoint-ORIG-GUID: 3Qwd8dOzF0-snTUNMmQehc9ct1Bba_w5
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c13e51 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=11IwEMuB_qlnYAimh1cA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX20o8U+zZ4+fO
 NWFqI+9K4Use8VZh1yUpaVx7eoBgqmpPYsC0szYfgdhZ2r3osIvviZ4z2nyvlL2lwgw8Qocy7Py
 XboBXq5kqwmqMSJ3tGe2RemRuHdM9eZj8hbvmC7PKQUon4k6JHgjQ1aZ2ikGtkMWEgkbOo+xNB4
 P+9f6Chz2t9wEZqj2lQubZrHOryIR8XR3/rdy0VEurI1mkbmN9nABPDFYkugD/D6MFkpi0kjyIn
 NiT7wLasR9LxVS/t2vckH3h2iTF4jGqWO1NMdScq0xTA55Vbsd9aTYwOi19PbcWwa0PL9s9N3XZ
 PnO/kbomq/4/67HPvSNZfFFDlc41j8VPcUu4SGkNWKuJj3VSeRqLaBlySGZRGCsadbk8Z+cC77E
 KVRXsm5fi437onCqr3gcrkwHELF//moCanmSwqvpooS2bhpJW2iJdvsuLiKoZlYMtlW3xwbo9uZ
 7hZMyFbfX1Q4QHKXrFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230103
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v10 0/6] net: stmmac: qcom-ethqos:
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
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-rockchip@lists.infradead.org,m:linux-sun
 xi@lists.linux.dev,m:devicetree@vger.kernel.org,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:sophgo@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:netdev@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 12F842F2C2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (6):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
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
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 +++++
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 401 +++++++++++++++++----
 26 files changed, 498 insertions(+), 72 deletions(-)
---
base-commit: 2caea0c68b85f5c2ee505a7fc0fe8d71060af7b7
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
