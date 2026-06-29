Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TuqXFQ1XQmoz5AkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 13:29:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D72696D967B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 13:29:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=Wv893MEJ;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=AXBk8Q+n;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B496C0693D;
	Mon, 29 Jun 2026 11:29:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 143B2C424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 11:29:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TATTFI2592877
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 29 Jun 2026 11:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Upw75PcXyy68WlOAyDJOIC
 UGb7kPKOHDSv26rXko7pc=; b=Wv893MEJ5CDA7qQ4tkvxKbURrlTBR/JjmLoLZx
 b6/94l7eScZQHwTQPdlabs/I1v094SWM9byDUgwBpO8huWmEWLS1P9frHUYJQYN+
 s3wG/2q2wrJZbjjKKAPSRNqcKCWQiPkd3PlzrZgYnSk4KTnln6u9m+Zxx2HuNSXV
 rWHuJIBH9O9iLDCSSZu1zdDUh/R9zJHl/JYpj0hspVvmgYKHkxk5TPYVhLOtife/
 cCBuLinMEQBGU5FzMxg7gdTUBWpR8MmWYsUvddIKu1580nM1S24+1D9bcqclUB80
 5X1YR0DRi3HGjUfGUqWw/zg2z8MtI70Yy3BlVvEEDDZgAjdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhdd2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 11:29:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e4aeea5c3so132576985a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782732553; x=1783337353;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Upw75PcXyy68WlOAyDJOICUGb7kPKOHDSv26rXko7pc=;
 b=AXBk8Q+n/VAsyLpVdJVZMijM20ASrEnVZ56aQoa/V3XcpajGjOlkFQM/G9qWKiH+fM
 Q6/PTOId0/I9BMYT45Su11/EpaKXHhjOWAXXhz8d2tuU4Ed/YAp/uiVn/ZbU4yUM4aGQ
 CPwl4B4NzHe8R1eX3CNMk8l5GQCqBAXns++PyYC/+lWVYU2Noy8n4yAaLpNzEYVQISMI
 W+w18S4DVQR0/OqJ5A7TPGmKpvC97s8kj05kbaRNwDu7CK8zQYTHmex9AlZFiy+hp+Zc
 tL4NW4SwqAquX4+ZzTxwu2ASqPY1kUdvkS1rL5JzT1NEN/dakvNqsmAeLWtHAcjNI/0v
 JCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782732553; x=1783337353;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Upw75PcXyy68WlOAyDJOICUGb7kPKOHDSv26rXko7pc=;
 b=DrZArXI197L8eOtsgK54Gc6dcOWGq3sMyjCE0tMm5B84IXs36HYMnsvOvCfxNeAE/1
 1hxY0tLzZKQijSIePu1SCOu5EBar17Fl3E2/s1vNlt2sA/YQGRi4MOLT3WtO1jNY8YVC
 foSYKNddIlNpOJr9+Fdnby95zMOdIKWp2r3cofBTyVFSm/6Pg/Kt+3WroqIDjSrGpAsT
 jyacXCLcQ4lYpzhYmxsdZbDtzDkczHFxhdarIqCpMfx+lyVtTBEptCBCw36PwHIsnhak
 yFN2Uv05zznRXi/bUzh3wYaMl5k+ZDUcjLOgKA+nY1H8UukmZszQxlmmFEMYjJOaOmFD
 Ffrg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9nL1vLKPIiYwbecawwY9o9AixfkmZg9+oXr+xH6qrhK0QA7YG+vf9kh5x/vmExOqDta7QkNRMA8nKVwg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1sLH9LF/6+JIGKw9UbBDOBH2FnUczWHPE30NVRJVaFt+m8OzV
 of1GqSRiFTxuyXeSUThtGEzkrXQwv6hG9JCLcxkPMB8Ze001n2km/8V91EuZ8qfxsJiN3Y2zTnE
 8/XQd9REUn/hUCN2BykLxBkVLUaZYVdWrLQSA3P7+jGpzhoo0F2NzQCqmeHGVi22xpOLkQEvU1O
 u70aLY86I=
X-Gm-Gg: AfdE7ckmVo1Nk2T26BiSosEVdsPqjFfBVAjA3bMM5VlGiTRLbzkpwjkKHqC17/bGOW8
 nqzBN7EvRaIStZkw0RQWBpQpJIgBCcJe/Saj33zNPl+zEJfRCJxeUgnx8ubDyXRZ+NoLVcagvkw
 ME50NC6nEu5txaB73zYoai/p16sdlP6GhmfnCse52awOX1mLHk+yl/ye+mLsXWW2oMTGAtU4yKn
 YkyM/Bgxz9vONvobOFvLQdNMP7VmTWZnoKpsJBfbsdKhUwfZY7aTg+BNnF6tDeY2Jh8F8VqjXyl
 XjxPQqbgoV09OfY3jAeoW5179nf5TtAw0gl7iHIgqh20bldh1/g/xGYojZ6/08aCu8WVlrWEswR
 Baibohsay9oYueO7RKLeiWmMDo6L9FB6XspzdyX4M
X-Received: by 2002:a05:620a:2252:10b0:92b:6e09:b0d9 with SMTP id
 af79cd13be357-92b6e09c3a4mr895295785a.21.1782732552955; 
 Mon, 29 Jun 2026 04:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2252:10b0:92b:6e09:b0d9 with SMTP id
 af79cd13be357-92b6e09c3a4mr895287385a.21.1782732552385; 
 Mon, 29 Jun 2026 04:29:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 04:29:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:46 +0200
Message-Id: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO9WQmoC/3XSwW7DIAwA0F+pOC+VbcDATv2PaQeSkDbSmrRJF
 3Wq+u9zI22NFHpBAsPDBt/UmIY2jep9c1NDmtqx7TuZIL5tVHWI3T4VbS0LioAsODDFueqPxRg
 9WXsq0jFWhTcMpG2sLJKSc6chNe11Rj9Uly5Fl64X9SmRQzte+uFnvm3COT67ASHjTlhAoSm6U
 DWYmP3uq+3i0G/7YT9zk/4nEMjlCC2Es45dGUhDLFeEeRKYrW4yQjSOmQG8q1JcEXZJZLOwQgD
 WOukYG+3XhfCTIAw5goUw3jUIngxj2vXjuD1/xy/ZetzK8Hh5ARgQ6RXgOeralBRrr9fAnIn7y
 4RBA+cgJ1AtEKCGYEr3AvILCDEHeYGsJ3Kl/C+gfwGFJZTNKAhUWR+0SY6bhl5ACAuJdLbj4NE
 vQQOVpH1EzlD3+/0XZnMXrDcDAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5779;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zST/BG6lwE90KABxMz7C3gimOZiCUsBv6Z+vt7mot+c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlb4z6i1V7LFPiYX7myMy+Zab60t8f6FaZvYc
 S6K4a2vmyyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJW+AAKCRAFnS7L/zaE
 w6+2EAC4p6MaWsl6CLBa20s5cg0XwuSA/09eEWosU//24wUcxOXeBCC0Ckj50xzZ9UafZh4uUAH
 A2t44kyEH7JNfCuK1zs7tyaD1NrguoATbzaRb+LlExpE2QYuX12VjND3MyeMwVjxO9kQe6tst1n
 cCgy7RqINwHDoSAZsEKE0d+exMWpdVOZtVYs8ODTE6PBhj+0ACoesyV5Ys/H1qJo2uFK8TyrdYm
 HOKUSOQcwDjEDmqGflmVMH1DTH1VFzvTKCDLr0iPeiHBbm2kLgYQOo49hAGSJx0PwqHetMHnijZ
 TUELl9CBuXQSDkB9IvnYn425GWyWUAswNoIxgLbVBeocdeMLyb1+xJqrdcqdBDeoYHeGA6JVN5A
 Amrcq8GVA24qnZgqv1DLVmbZRF3n6RBPDfu+hp3DzX8SOwzLOWmjBe6pWfJgeNjkGDE4CaMGwYy
 AojwsvrwrrXsKAdMKPOF9JnODe8W8M6W7xgFCRAHvGv/hd5sK6cIytAVtoQwhIXw7l5rOjgXhCX
 /hAUJFLF93knEoI34kI1JLAA4qjgqk7hCOGv8E/oWF++NzkbaTZe3Iqbd9id0g4KtGg6XtvOKC+
 P3BDLM8h7ex3dS0B+E8tEUC6HqqBaaVN3DgdGm2sBzMUMD+Cgdj/FSGamA/r0/SynBZ09PsL0xG
 MF2d9PgEUuZMQFA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 2KXBtWmpIrr7NPhXTBR3AGi0X2REFjod
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a425709 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX02Rp86mQhntg
 tpGsrznAKZfaoAxOl//ODOt0xHVPzP1/RqcbbIgJHP0trqHQnWmDOyqBJPNHSA+9TfQKNIsJpFo
 dSnWB8txNZRvrsvaujxKI8P6fLs0OjM=
X-Proofpoint-ORIG-GUID: 2KXBtWmpIrr7NPhXTBR3AGi0X2REFjod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX5zBL+aWR8Vp4
 MXLASRhKHEvggYC0RL9Emx6PVqlyjZnbuUWOSmg90wUhFGeGpEfbYxh5V2kKZKaKbeNhamnBkYh
 vI2Y+9XanMpPiXwoMCvTLZh8UphyOtRK1ygRMhQX2WVzvxjByj0epAPM+xabW8hizYQXvZxsTjy
 awxOxgPoNsFUqyfRpO2LnjtRgrMb6QgXjtgIWWmG16DJUXCNIygXW6q8KD4eE0meRfGa1rFRpQ3
 VDV4cPO2vmKKh47up53G24evsjdPQwasDX2ZiITVRMUq7X4sfyfIIHP0ZzZO6aRvVD5O/PTyWzY
 4aKkhI7LtcIoO6yhbO1OpY3Ncs+4XSuws+vIab3vuHKyEwlbXy/oIQKTsnHFLXRwxylidqPjFqd
 K+xAA6BsK/ur65GwVWgRCmXfxpj3kfjh8nivWGSBJL+V3FWLXg+g9vm0C4XZuT+lXve8Y0xwGiM
 KfAqlmjjfjnYtS04/Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094
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
Subject: [Linux-stm32] [PATCH net-next v11 0/7] net: stmmac: qcom-ethqos:
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
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:imx@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:prabhakar.mahadev-lad
 .rj@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_GT_50(0.00)[52];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,lists.linux.dev,googlemail.com,bp.renesas.com,kernel.org,lists.infradead.org,linaro.org,tenstorrent.com,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D72696D967B

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (7):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
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
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 ++++++++++
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
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  51 +++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 230 ++++++++++++++++-----
 drivers/phy/qualcomm/Kconfig                       |  10 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 161 +++++++++++++++
 29 files changed, 573 insertions(+), 56 deletions(-)
---
base-commit: a8bd881f6c5eeb8fedf29d8dc0df9296de576f93
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
