Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCbYIvz2qmlaZAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A281224254
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98B49C8F281;
	Fri,  6 Mar 2026 15:47:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D2BEC8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 15:47:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FT3o8457482
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 6 Mar 2026 15:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=s7+GDpIdG2iguwUQE64k+F
 OMd/bKz4kwkSaaXmdUVO0=; b=VZfYEMdQLwm3iGAC8DTJYKn9ThXfpZxkj8H5O9
 CxC6cxr3IAoE1xNSfDYa4MPhmG6nCTd+gUJmCMhCaV/RU0LiRWTkJ7hHrS+AULiw
 OaBh1VseKUHqqHAGdPDpFybbsMTxBeDzf3sU6AppYKVicsaAljTT99rK/1zp+DMJ
 QFh6FPfkB83m9Nu8o2CxdxQUnlQwm+8gOK/GIYGv2LpH1oM8ASFq+ESsbB2SsDD7
 1WKZykouR/FN9jI6kUmrg7iBn/w8kxjL+Zr842gMr6ckoywG0wngMn+3CL6WSPFD
 D8FblqQjRiKAp1YWk+n9mSbHqJhp7bf835XLtHl0xj4RdhrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25urcw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 15:47:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c711251ac5so5137677985a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772812023; x=1773416823;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s7+GDpIdG2iguwUQE64k+FOMd/bKz4kwkSaaXmdUVO0=;
 b=hnxRUEbO7ujYwv0ibpTLigplCXPJwc7/aRatbyOZFcOkaBzwsNtJ7nFFZOCuoQC7J5
 n6FRyHBNKCT2zo2C2DK0ZqxsXdiWZKZnwhbAbtMqEGog22vqDDDGaLNiOnRHV0sKpbEZ
 T+TnzFjnsaCy2VDuiZsI751r/2ZjnxWbpi7duhQk2drEDyNyA4VbLyKZ2Z6MPldTS70K
 kzCckuXliD/nivDaakewXWFpUKY1tHzea5m33BODYtG/+rIMIUNwjPMBWzAbFZSaD2u0
 YX9ddZBuQpxMBPWOZliVYYDMh0E9JbdSOkDhhFz59B1xqTVyVKy+cG5rm6YCOdaoGku3
 Mbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772812023; x=1773416823;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7+GDpIdG2iguwUQE64k+FOMd/bKz4kwkSaaXmdUVO0=;
 b=o2MZ99J2gRI+J5Tt/bc3++Ux4AvoffFbpQSiQSsWcRSFfXaBoUxW03UqzDYY9FvSPA
 7Jw5MbSNhS7mvl9puua0/g3YvRG9OPfkr6Nq/rW4HouJfq5FsxuPu4RcSR1kG7hWfmoZ
 QQivXnGbJ+Nx5dChxv1ZzOLmLhOco/V85KhaVWEUPSPjNwCp+tSS8wXIyiocbhNbQTSP
 KemSojA307DJ8MV3XXaxTsw8/Mnv13crZVSOhFPiHz87pvNlkfxye14b/bSErXuBJqRM
 2FbPenA4ILI3XLweXCq/lbQkM9lKoQAvmILArYjVgK5P4m7icfvWnSwiUQzcfwooCrNF
 2ZPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzBDeAt5sVhgmDBOcWWsRQLt2/bvEnqcfLan2dzbiWGKGNLZvHEvHl2HZZEer6qHMAEC3URx6Rz1y0/Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYAp4zmhBphBZu03wXCeSyyR1LBkgBOUNDEqL9H7eesMub2hJ4
 ZTiVbXJBMkSZnCP4u1rz/tcrCIUWyhU6tVr+myDREZeAkuv7SY3LzKkCH3IO12k9FLyghP9d6er
 Ytw6D51Ke0kYd05ikBpScLAhO4dF4dId1ZIbbRZ/ZxQPY0c0MvJiVWHGCsN0FmZdg8GHAvorAvz
 04FqedcXU=
X-Gm-Gg: ATEYQzwFSiDdDFhNIpZ+aOV1iqSB6pSAGVcTCfVAvl6mt/hZad7c1h8YonCC9oBh2rJ
 9SYj+uYKp+c4I3AkgoW/HlSvJaxy93nqLPzbAGThIZYMN57sb08yP7IahT/kSeWtsq6xTYQ1DM8
 NaX2h2vT0rERuqhp2r8vZh0FesLMhfLlGXgHphCggf5d/O9KxfHIAMK4+UT9bLGdLZtAb49Xv0+
 U62cAvi2ZG58LWN8c5+ouDLtgSXMlIktlmrkfiuGooOIHjFzXHVHX9Qt1C185+Zw6kJWjYoFvMv
 IdIDaPY7uXD+d0ZJ4H4Mf2U8NLJYuc0KmOp2Bayb9AmhWm9EMeYkX6Qn4gkBQ5XPklaa4DTXUPW
 4e0GmMUwrIoM7yaE4HAp1gd1JgXpbm59pW2Oah1XRZKVNNVQUqY60
X-Received: by 2002:a05:620a:480c:b0:8cd:6175:9b17 with SMTP id
 af79cd13be357-8cd6d324d9cmr316910485a.3.1772812023121; 
 Fri, 06 Mar 2026 07:47:03 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:8cd:6175:9b17 with SMTP id
 af79cd13be357-8cd6d324d9cmr316900985a.3.1772812022400; 
 Fri, 06 Mar 2026 07:47:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 07:47:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:38 +0100
Message-Id: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN72qmkC/3XQzW6DMAwA4Fepcl6QnX926ntMPRgIbaRC2oShT
 hXvvozDOgl2sWQ5/hz7ybJPwWf2fniy5OeQQxxLYt8OrL3QePY8dCVnAoQGC4rf2zjwTE5ofeN
 +oJY7ZUBITa1GwUrfLfk+PFbzg41+4qN/TOxUKpeQp5i+1mEzrvXVrRF23Bk5cCnI1m2P3hh3v
 IaRUqxiOq/cLH8JBGH3CFkIq62xTS0kULMh1IvA3e1mVYjeGmMAnG09bQj9l9j9hS4EYCe9JOq
 l2y5iXoTAeo8whVDO9ghOKIP+GHOu7p90LU+HqoSfyxfAAKL4D3CGZKcaQZ2TW+C0LMs3WLN6r
 xACAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Romain Gantois <romain.gantois@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4813;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9XdbdEuY3r56nFysWw/+z8F36Fo03OLGA684GE1V7LQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbl89SImz11xHcuz4WDVyxsJu7Xg04hSUq/w
 BshdqAyIB2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar25QAKCRAFnS7L/zaE
 w/ttD/9UXcdtgk6BPmYCk4u4YMb/6T+/x/SMFrWGNcnRTVeKZmKBx4XjiUEWNxvf5vdXE7bS7LI
 3pNu8sde/ehrP/o4h65JxnvK+daDpw2rs1rxMwbf8Osf2XcY4xBuLdhoUkfj6X2E7xkc7OCLDF5
 0GJcZkdvmaL/0qU2JQf1bsrSRnGrI0bz2c+oLTE3kEW2mzFJ3t8ZIHUR5Q8xrSeJubKdIJ9mDC5
 6mfHpHuReCcjyw49JAEkqKZAIhrqunr5JJ6dyIAWPIwqcxsdZ1aeOaBnQXpXnootXhGIm+PO93d
 kGukWxEniA2Gprewa2DHJdYLbCtTS3w5D7Fl3OSIZJ21wDu+kjUeI5SyziMbdj4Z7wXtrB+Jc+U
 Js61MNa07EM9v717I0ht1296Ag55084wrRRZngMtH40//I9x6VshC0VMEIRt9s23cCuV/bVoP2e
 5m+r5Kug4Vn1Jrov/zT/uyi3UU94Z1C8yl4WhipbO8JVGiAw8o+5sBtB+WJIJy7ucZbFs6MlCVa
 CjkVBLpUBQI0ypw49JdCOhl2qe+Kx5IJLBzuTrUxNgaZ4cV67SsTlP760yTMVxNmv67oU7ojW0l
 9InFvM/EOxvqQqfpGCJLI11zBLgGUzSx/uH5Uf5IyATrOA/Bv0VWr/3rEap3MqTV8KG7sMr5MBS
 fYcPCKLAprXrKvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 6cFuXnzAaoLx6V9fXmgMZle1QkhwaljK
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aaf6f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8 a=h7uu4O38hj_b6GN6T5YA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX9DESq/YYYMgp
 z+N11xCASqL77WAL+TUSGq0nEbiRqy6B6aNX/ZQRFiaWumNgNr+Uo3xOVQLEOkXQHoJ/Xkf3XQi
 v88+7nCPefEt9AjixOooNbqYBqNr6jf6PJFKV6esM9UpfLWHauqCS+KcrLfUYN0R30Flg2Qo7K9
 /+50Vekz2uyKYRIgSUgkw8Hknd7FJSePTcDQsIVWGbuzpjQQ6tGgp1ArI6fuMBLtoO8tkq7UT16
 heQcH7AdUtutCXGBgteyjCzHEKLROQengbKvic6Oy6/m4s+WtyWTHxCvz+jnetjWS77BXJQ3plf
 yz7cJzvO+pyy9wyr/IDtF1Bp4WFffURgE6M9LdXPE3REkW4RjwLIRH8rFgctBaR74sMmV5Il3FE
 3eYjhXhOAPFWDKzU9djOV+RNJXeuD2/8C+lpG0n857f0BKybpA0OFEa2g8UbfzY16ZVehmFOnol
 Ks6h3j463w29l1vok7Q==
X-Proofpoint-GUID: 6cFuXnzAaoLx6V9fXmgMZle1QkhwaljK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, brgl@kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add
 support for SCMI power domains
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
X-Rspamd-Queue-Id: 0A281224254
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
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:matthew.gerlach@altera.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:keguang.zhang@gmail.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:romain.gantois@bootlin.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:heiko@sntech.de,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:kernel@esmil.dk,m:minda.chen@starfivetech.com,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat
 .com,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:liangshuang@eswincomputing.com,m:lizhi2@eswincomputing.com,m:weishangjuan@eswincomputing.com,m:vineetha.g.jaya.kumaran@intel.com,m:xiaoning.wang@nxp.com,m:linux-imx@nxp.com,m:Frank.Li@nxp.com,m:david.wu@rock-chips.com,m:samin.guo@starfivetech.com,m:christophe.roullier@foss.st.com,m:swathi.ks@samsung.com,m:brgl@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorr
 ent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[78];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.523];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,linaro.org:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (7):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
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
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 ++++++
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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 346 +++++++++++++++++----
 26 files changed, 453 insertions(+), 62 deletions(-)
---
base-commit: cfb9039037a5796e3880d225d657165f378bb2b6
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
