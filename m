Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE6CF224B
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D4DDC56612;
	Mon,  5 Jan 2026 07:16:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B39DCFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 11:42:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJBPxvT4153970
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 19 Dec 2025 11:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=pWp06pWmbjSJvf7fIHkRuG
 NgN8f0S0siEmA5b1mlZsk=; b=RzTHsM0X2eAVgNkpqzV4KcHaBNbRa8NsXlPAxt
 42E1B9C8t4UZ7DRJQSLJNmBT5HoZanJhTGHOxwQKdKRMzjO7VmRpjYny/gJm4cHA
 c/AKbn+yDDxMez/LuoP93x4n/kWRXNYw+w1PiQ0+X1HFdesFVQE2Wd5EQleXpOFi
 P83ccJH61gP+B9P8A93PaamGzq9B+v6Oe7VGpyWSMt9ao2wgvUb17b6whR9repqz
 YeF3uEKa1nOJuHRgSyLVO9IAFAb8fI5BbH0PJuY35JZufcCGQ6O/9N/IXR5huMcc
 PotSODojz7ryMlBtHRIcEZeP3WTb766UV6I2+1UisFqKPLLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cthsv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 11:42:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed74ab4172so34502961cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766144564; x=1766749364;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pWp06pWmbjSJvf7fIHkRuGNgN8f0S0siEmA5b1mlZsk=;
 b=C3fx/p13cXQ5V9wvamm29pYJtBXcNFZ8LU4o35PV8LQEd0I1YhH75eVhZ8/+cN+Wez
 6Yv6JhJBB9gS3+5rwOt3riG9CsU2AxFGs/w7cFp0nN5HRjZ/U1l9rlN3tQmZG3VgW927
 q4J9isD4lLAMfK6zS7jgpfkiGybLb+PeJXm48Ik+EuIojdtUfhDg6BtwrwuSIH7Cs2T5
 RFcaOW9Ph1I2fYiqCb1kD7shSCeYE7oUEEXaQJ6SC2x7TN1PCLs8or2JZy2dJNatwm/c
 BY2SrKUlDx2PCnZv8C7TMGBcT/KFT5tu289cyaAjEwLc/9d1nmzsMKpFYK1LCtmF2FMl
 FQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766144564; x=1766749364;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWp06pWmbjSJvf7fIHkRuGNgN8f0S0siEmA5b1mlZsk=;
 b=RAA5Ny102AeMx8p03I/3eMujrLngM9zEaXJsV0VLChF/ndHyHDpvZ8XZVttGyKoV2W
 Q7cD54V/I0dRuHc5vAVIHcfRPYkdNptYDdxIDt5lXFFfJJGDy+BtOOeFChhmGP2rkP3F
 rneCSNct4AM2GD7IZm5q+xXLHG8xxRdhCDLT8+/GE047xVamP+/5FpWOkP34fqNvHOKb
 4WzejBLO7E27SUDuj8nAL63IMyp3o4QXiKaHb0fwSJ8938Qzbu1l+YoOi8ET0O6XjsAL
 iaGI4/KBHsa+T/lE+zIBejB0DR55FcIV1z+I1y4/VEpvBx75C1DbXwBpxDlvWQqVteXY
 8l6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTCvqJse5ygaAYQjdgHLnEMSeLDCgdCx89OhCF9+auYUMby1lQZ6sAEg7TQDvy2K5L3LSaTwmB8BervA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwWx+0HYEzDTIRV+RdbPmYPCY5UeVb1U3AG0394ulj1KfkaJbw2
 m/BUpj+fCT4pVAaXdKItrLVDTrLJVWDqp5u61E9X8d8rT13kaX0EMJoPaDg82aa9igY8mdoBoIJ
 J5vek/jKMf50fAit17v37NicbKaiLafTQCX+eXbTr71+roFHSDXKWmUHqf9q3PqqOfgNB3bGrZS
 hktcxe8OA=
X-Gm-Gg: AY/fxX57DFMrJyh1DnLMPsNGWMhLslWvwVHSQ6ZDOI/L7rUlNXTVBTVXaJmKMCw9D7x
 axvSpcQf+8JPib0dGbQOsrKAl8lFKycXGW/tTcUC+YoZfkgWne0Q6CQi3yT6GRP710AyFx5mIp+
 a4IPI/H7mx1VAbqvtJZVheydLWxaLEdcFkxV4bARZhXbU5n1W70GLC1VR+QeXdFsO/k0e3don7F
 MJIhUNWhsnjUAYz30uW1+j2NvrJ+QrYfDMqi//vrgYRVeECEx1RW/xmZN08zsBb6mOA0uqMOzuh
 u+z8SNosxpg08LeToWLdCxUfn8teqKF7L0Sb5hRnrjOYBtpDY/k6TZ0dpPqlFqur/xYIrH/JnMF
 jBE4ffEAwWc188iLSgYUYy8O+e86QmFSwctkUZWs=
X-Received: by 2002:a05:622a:250c:b0:4ee:24b8:2275 with SMTP id
 d75a77b69052e-4f4abcf6df2mr32638571cf.1.1766144564327; 
 Fri, 19 Dec 2025 03:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmBbFYUgOlr6WN956Einac/qKi2Xml3/A2v+AE7uUKmhMDZRt/gScziSp2QVRxwtyeDwUkJA==
X-Received: by 2002:a05:622a:250c:b0:4ee:24b8:2275 with SMTP id
 d75a77b69052e-4f4abcf6df2mr32637891cf.1.1766144563807; 
 Fri, 19 Dec 2025 03:42:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 03:42:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:15 +0100
Message-Id: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABc6RWkC/23PywoCMQwF0F+Rrq2k7fQxrvwPcRFrRgs61VaKI
 vPvVgUfOMsbyEnujWVKgTKbT24sUQk5xL4GM50wv8N+SzxsamYSpAYLDT/5eOAZndT6yOmAnrv
 GgFQavRaS1b1joi5cnuZyVfMu5HNM1+eJIh7Tl9YKGNGK4MCVRNv6TpAxbrEPPaY4i2nLHlxRb
 0KAtGOEqoTV1th1KxXg+o9oPoQY7VSaSnTWGAPgrCf8I/Q3MfqFrgSIjSKF2Cn3W2QYhjugyuI
 afAEAAA==
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
 Swathi K S <swathi.ks@samsung.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4401;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UaHO7/eOvI9UQifWvLpwmCqdh2eotyE0wYd3BHrZ6yo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTokWXsa2gKI4nKr8h3MYxFUimxm2O4dHtXW6
 KCiHQiv+CiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6JAAKCRAFnS7L/zaE
 w5TBD/0VsHh57NK5nQksuR+8VSL79RDSjE5N4Uss3l4JwiFExzXFJZFpCwifvwH9coSoqlwSmi/
 HJxLjwprjYGZnaU+rNXkOiZ0EsDovcObvNYahOJjd6Lo56NFM5cKuvxZIPtBE+iyaBwmzxnLmu/
 T2hRwgo12C7kTrrBKQUhlfxq8n1b/ffXt8j3ZcPGUYWSirWStJVUES0McEPRujOtu1OkWm1SPmV
 Ejrd9L49HQ+nO6ayV3/BwwVVypRf+179KBzXtsYmh2ARvDwjC12TUaLQ1v4RX9OXsYdoYgch/S6
 yvKvCxXExRkXnvfNQShDqpwxsqQH+ugBqbTLmnyBt4Yr9mDyozKPTqaktQISbSrpK229wF+8Wqv
 8y4/UN1sWaRnu0hyRREDiaMQRMu9WPHyGDpBBS8WNsUk7q//HXhhNZhgg3nn9uvVNiEqwD0mE/F
 awDlTEUaCzTLaExwn/CKC+RL+ri68hNQj1CiAfnruILFOSDcjcS6x2jWeVHJ2DjVby4z6+Gf2vV
 oduw+zcDEJ1Xe9k2AEYXRVqWBwYmIbh2NxHM9AaMWrxwouwIUENXthjhKxJB9V+Z08rtzMIYqnf
 jYCydlPUBZgHMvymTXbhPio9aTl7NoQa5wAPhUk2jOJbwWYIDgFqegzo+VSItUKDNtUvi8/qrdR
 +XbsmEDfNuXywwQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: uC5-4KAdpUKJJAnAeCGHQE0LVc343cEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX0mYisUKj1YsT
 g7f74kIbUGDT/5Iw2fLx9OaoJecLTmxWL228AbOUIxlTDtUqcXAMJQcG9hrn80/T3fI9BJROzFn
 Pwgr4ckaICt76Xyj1yPeITTvM2b6QrYohNnw0Pyb879mCx9uXYP0Lz4Ov7fk7O2D3LYMnqydVIF
 9smPgVhvuFt1A5v8aP05HtD8OXwBqCV8E/NyemWW9SBmTU7kEHBsZQoFHJn9O7u84k+2c//ogGT
 1afXQDEhkhJWar5FwQdDu8IvGOxdByij0cuW8S2PFdtJ2MG2qi2hqrvp5wUfMy1wz4ofHIXSM9d
 dElAUwqKAiuOeIYaAHrWlefbi1U73GP03dFauPNaKYGlej0Ccytpbk0z/dhe14SccmQ9HrxFYoz
 QNjYTg09xb2aIs7rELFVRYXmB8GpjvPbD7VbtgIBHm6u9kA3p7PqZZJv4yF3NfU2eE2BP7SJN/2
 3wr8rOmTT03A0uJQsTw==
X-Proofpoint-ORIG-GUID: uC5-4KAdpUKJJAnAeCGHQE0LVc343cEw
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69453a35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8
 a=h7uu4O38hj_b6GN6T5YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190096
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:21 +0000
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/7] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org

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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 344 +++++++++++++++++----
 26 files changed, 454 insertions(+), 59 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
